# frozen_string_literal: true

# :reek:InstanceVariableAssumption

module Evostream
  module CLI
    # Class for parsing option used in CLI software
    class Options
      CASE_HELP =     ['-h', '--help'].freeze
      CASE_CMD =      ['-c', '--commands'].freeze
      CASE_SERVER =   ['-s', '--server'].freeze
      CASE_ENV =      ['-e', '--environment'].freeze

      def initialize
        @file = File.read(File.join(__dir__, 'help'))
      end

      # Parse options and execute action if necessary
      # rubocop:disable Style/EmptyCaseCondition
      def parse(argv)
        @command_line_args = argv
        case
        when include(CASE_HELP) then          display_help
        when include(CASE_CMD) then           display_command
        when @command_line_args.empty? then   display_no_command
        end
      end
      # rubocop:enable Style/EmptyCaseCondition

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

      def display_no_command
        display_help
        raise CodeError::Syntax::OptionInvalid
      end
    end
  end
end
