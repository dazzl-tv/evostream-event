# frozen_string_literal: true

module Evostream
  module Commands
    # Returns a detailed set of information about a stream.
    class SetLogLevel < Command
      def initialize(commands = {})
        super(commands)
      end

      def cmd
        "setLogLevel?params=#{encode_64}"
      end

      private

      # Change the log level for all log appenders. Default value in the
      # system is set in the config.lua file, which is usually set to 6.
      #
      # Log Levels:
      #    0 - Fatal
      #    1 - Error
      #    2 - Warning
      #    3 - Info
      #    4 - Debug
      #    5 - Fine
      #    6 - Finest
      def level(param = 'null')
        "level=#{param}"
      end
    end
  end
end
