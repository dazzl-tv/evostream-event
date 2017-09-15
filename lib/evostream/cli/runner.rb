# frozen_string_literal: true

require 'colorize'
require 'option'

$LOAD_PATH.unshift("#{__dir__}/../")
require 'event'

module Evostream
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

    def run(args = ARGV)
      @options = CLI::Options.new
      @options.parse(args)

      execute_runner(args.last) if args.count >= 1
    ensure
      return 0
    end

    private

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
      unless cmd.start_with?('-') || cmd.start_with?('--')
        puts 'Prepare command'
        act = Evostream::Action.new()
        puts 'Sending command'
        result = JSON.parse(act.execute_action(cmd))
        puts "Result : #{result}"
      end
    end
  end
end
