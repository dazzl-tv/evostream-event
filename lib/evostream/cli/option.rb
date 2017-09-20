# frozen_string_literal: true

require 'option/argument'

module Evostream
  module CLI
    # Class for parsing option used in CLI software
    class Options
      def parse
        Argument::Arg.descendants.each { |klass| klass.instance.used? }
        display_no_command if ARGV.empty?
      end

      private

      def display_no_command
        Argument::Help.instance.send(:action)
        raise CodeError::Syntax::OptionInvalid
      end
    end
  end
end
