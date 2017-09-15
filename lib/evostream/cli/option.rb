# frozen_string_literal: true

module Evostream
  module CLI
    class Options
      CASE_HELP =     ['-h', '--help']
      CASE_CMD =      ['-c', '--commands']
      CASE_SERVER =   ['-s', '--server']
      CASE_ENV =      ['-e', '--environment']

      def initialize
        @file = File.read(File.join(__dir__, 'help'))
      end

      # Parse options and execute action if necessary
      def parse(argv)
        @command_line_args = argv
        case
        when include(CASE_HELP) then          display_help
        when include(CASE_CMD) then           display_command
        when @command_line_args.empty? then   display_no_command
        end
      end

      private

      def include(case_parse)
        case_parse.any? { |value| @command_line_args.include?(value) }
      end

      def display_help
        puts @file
      end

      def display_command
        puts 'Commands :'
        Evostream::Commands::Command.descendants.each do |cmd|
          puts "  - #{cmd.to_s.split('::').last}"
        end
      end

      def display_no_command
        puts 'No command executed !!'.red
        display_help
      end
    end
  end
end
