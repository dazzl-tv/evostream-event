# frozen_string_literal: true

require 'singleton'
require 'colorize'
require 'timeout'
require 'socket'
require 'yaml'

$LOAD_PATH.unshift(__dir__)
require 'option'
require 'config'
require 'search'
require 'code_error'

$LOAD_PATH.unshift("#{__dir__}/../")
require 'event'

# :reek:FeatureEnvy
# :reek:TooManyStatements
# :reek:DuplicateMethodCall
# :reek:NilCheck
# :reek:UtilityFunction

module Evostream
  # Execute CLI with this gem
  class Runner
    attr_reader :options

    def initialize
      CLI::Config.instance
      @options = CLI::Options.new
    end

    # rubocop:disable Metrics/MethodLength
    # rubocop:disable Naming/RescuedExceptionsVariableName
    def run(args = ARGV)
      @options.parse

      access_evostream?
      execute_runner(two_last_arg(args)) if args.count >= 1
    rescue CodeError::Evostream::ConnectionFailed
      201
    rescue CodeError::Evostream::NoResult
      200
    rescue CodeError::Syntax::CommandInvalid
      101
    rescue CodeError::Syntax::OptionInvalid
      100
    rescue Evostream::Commands::Errors::MissingMandatory => error
      $stdout.puts error.message.red
      50
    rescue CodeError::Finished
      0
    end
    # rubocop:enable Metrics/MethodLength
    # rubocop:enable Naming/RescuedExceptionsVariableName

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
      if CLI::Argument::Search.instance.search.nil?
        $stdout.puts result.to_yaml
      else
        CLI::Search.new.search_node(result)
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
      if CLI::Argument::Search.instance.search.nil?
        [args.first, args.last]
      else
        [args.last, args.last]
      end
    end
  end
end
