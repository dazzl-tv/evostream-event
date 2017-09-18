# frozen_string_literal: true

require 'colorize'
require 'option'
require 'config'
require 'search'
require 'timeout'
require 'socket'
require 'code_error'
require 'yaml'
require 'yaml/dbm'

$LOAD_PATH.unshift("#{__dir__}/../")
require 'event'

# :reek:FeatureEnvy
# :reek:TooManyStatements
# :reek:DuplicateMethodCall
# :reek:NilCheck

module Evostream
  # Execute CLI with this gem
  class Runner
    attr_reader :options

    def initialize
      txt = <<~INFO
        ##################################
        # Start Evostream CLI \t\t #
        # Version #{Evostream::VERSION} \t\t #
        ##################################
      INFO
      puts txt.red
      @config = CLI::Config.new
      @options = CLI::Options.new(@config)
    end

    # rubocop:disable Metrics/MethodLength
    def run(args = ARGV)
      @options.parse(args)

      access_evostream?
      execute_runner(two_last_arg(args)) if args.count >= 1
    rescue CodeError::Evostream::ConnectionFailed
      return 201
    rescue CodeError::Evostream::NoResult
      return 200
    rescue CodeError::Syntax::CommandInvalid
      return 101
    rescue CodeError::Syntax::OptionInvalid
      return 100
    rescue Evostream::Commands::Errors::MissingMandatory => error
      puts error.message.red
      return 50
    rescue CodeError::Finished
      return 0
    end
    # rubocop:enable Metrics/MethodLength

    private

    def access_evostream?
      Timeout.timeout(1) do
        test_server_started
      end
    rescue Timeout::Error
      raise CodeError::Evostream::ConnectionFailed
    end

    def test_server_started
      uri = URI.parse(Evostream::Service.uri_in.to_s)
      socket = TCPSocket.new(uri.host, uri.port)
      socket.close
    rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
      raise CodeError::Evostream::ConnectionFailed
    end

    def execute_runner(cmd)
      test_command(cmd) do
        payload = cmd.last == cmd.first ? {} : create_an_hash(cmd.last)
        act = Evostream::Action.new(payload)
        interpret_response(act.execute_action(cmd.first)[:data])
      end
    end

    def interpret_response(result)
      if @options.search.nil?
        puts result.to_yaml
      else
        CLI::Search.new(@options.search).search_node(result)
      end
      raise CodeError::Finished
    end

    def test_command(cmd)
      cmd.each_with_index do |one_arg, index|
        raise CodeError::Syntax::CommandInvalid \
          if one_arg.start_with?('-', '--') ||
             (cmd_exist?(one_arg) if index.zero?)
      end
      yield
    end

    def cmd_exist?(cmd)
      Evostream::Commands::Command.descendants.none? do |command|
        command.to_s.split('::').last.casecmp(cmd).zero?
      end
    end

    def create_an_hash(arguments)
      super_hash = {}
      arguments.split(': ').each_with_index do |value, index|
        if (index % 2).zero?
          super_hash[value] = nil
        else
          super_hash[super_hash.keys[index - 1]] = value
        end
      end
      super_hash
    end

    def two_last_arg(args)
      [args.first, args.last]
    end
  end
end
