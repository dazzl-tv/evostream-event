# frozen_string_literal: true

# :reek:InstanceVariableAssumption
# :reek:TooManyConstants
# :reek:TooManyStatements

module Evostream
  module CLI
    # Class for parsing option used in CLI software
    class Options
      CASE_HELP =     ['-h', '--help'].freeze
      CASE_CMD =      ['-c', '--commands'].freeze
      CASE_HOST =     ['--server'].freeze
      CASE_PORT =     ['--port'].freeze
      CASE_SEARCH =   ['-s', '--search'].freeze
      CASE_CONFIG =   ['--config'].freeze

      attr_reader :search

      def initialize(configuration)
        @search = nil
        @file = File.read(File.join(__dir__, 'help'))
        @config = configuration
      end

      # Parse options and execute action if necessary
      # rubocop:disable Style/EmptyCaseCondition
      # rubocop:disable Metrics/PerceivedComplexity
      # rubocop:disable Metrics/CyclomaticComplexity
      # rubocop:disable Metrics/AbcSize
      def parse(argv)
        @command_line_args = argv
        case
        when include(CASE_HELP) then          display_help
        when include(CASE_CMD) then           display_command
        when include(CASE_HOST) then          use_host
        when include(CASE_PORT) then          use_port
        when include(CASE_SEARCH) then        search_in_response
        when include(CASE_CONFIG) then        use_config_file
        when @command_line_args.empty? then   display_no_command
        end
      end
      # rubocop:enable Style/EmptyCaseCondition
      # rubocop:enable Metrics/AbcSize
      # rubocop:enable Metrics/CyclomaticComplexity
      # rubocop:enable Metrics/PerceivedComplexity

      private

      def include(case_parse)
        case_parse.any? { |value| @command_line_args.include?(value) }
      end

      def display_help
        puts @file
        raise CodeError::Finished
      end

      def display_command
        puts 'Commands :'
        Evostream::Commands::Command.descendants.each do |cmd|
          puts "  - #{cmd.to_s.split('::').last}"
        end
        raise CodeError::Finished
      end

      def use_host
        @config.change_host(parameter('--server'))
      end

      def use_port
        @config.change_port(parameter('--port'))
      end

      def search_in_response
        CASE_SEARCH.each do |search|
          @search = parameter(search) if args_has_present?(search)
        end
      end

      def use_config_file
        file = File.join(parameter('--config'))
        @config.load_custom_file(file)
      end

      def display_no_command
        display_help
        raise CodeError::Syntax::OptionInvalid
      end

      def parameter(search_case)
        param = @command_line_args.find_index(search_case)
        @command_line_args[param + 1]
      end

      def args_has_present?(ind)
        @command_line_args.find_index(ind)
      end
    end
  end
end
