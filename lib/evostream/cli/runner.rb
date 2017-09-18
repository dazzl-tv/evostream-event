# frozen_string_literal: true

require 'colorize'
require 'option'
require 'timeout'
require 'socket'
require 'code_error'
require 'yaml'

$LOAD_PATH.unshift("#{__dir__}/../")
require 'event'

# :reek:TooManyStatements

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
      @options = {}
      prepare_configuration
    end

    # rubocop:disable Metrics/MethodLength
    def run(args = ARGV)
      @options = CLI::Options.new
      @options.parse(args)

      access_evostream?
      execute_runner(args.last) if args.count >= 1
    rescue CodeError::Evostream::ConnectionFailed
      return 201
    rescue CodeError::Evostream::NoResult
      return 200
    rescue CodeError::Syntax::CommandInvalid
      return 101
    rescue CodeError::Syntax::OptionInvalid
      return 100
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

    # :reek:FeatureEnvy
    def test_server_started
      uri = URI.parse(Evostream::Service.uri_in)
      socket = TCPSocket.new(uri.host, uri.port)
      socket.close
    rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
      raise CodeError::Evostream::ConnectionFailed
    end

    def prepare_configuration
      Evostream::Service.uri_in       = 'http://192.168.203.122:7777'
      Evostream::Service.uri_out      = 'http://192.168.203.122:80'
      Evostream::Service.name         = 'dazzl_'
      Evostream::Service.web_root     = '/var/www/html'
      Evostream::Service.model        = 'Channel'
      Evostream::Service.model_id     = '_id'
      Evostream::Service.environment  = :production
    end

    def execute_runner(cmd)
      test_command(cmd) do
        act = Evostream::Action.new
        interpret_response(act.execute_action(cmd)[:data])
      end
    end

    def interpret_response(result)
      puts "Result : #{result.to_yaml}"
      raise CodeError::Finished
    end

    def test_command(cmd)
      raise CodeError::Syntax::CommandInvalid \
        if cmd.start_with?('-', '--') || cmd_exist?(cmd)
      yield
    end

    def cmd_exist?(cmd)
      Evostream::Commands::Command.descendants.none? do |command|
        command.to_s.split('::').last.casecmp(cmd).zero?
      end
    end
  end
end
