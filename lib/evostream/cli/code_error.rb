# frozen_string_literal: true

module Evostream
  module CodeError
    # Program finished correctly
    class Finished < RuntimeError; end

    # Error 1xx
    module Syntax
      # Syntax to command is invalid
      class CommandInvalid < RuntimeError
        def initialize
          puts 'Command is invalid !!'.red
        end
      end

      # Syntax to option is invalid
      class OptionInvalid < RuntimeError
        def initialize
          puts 'No command executed !! No command precise.'.red
        end
      end
    end

    # Error 2xx
    module Evostream
      # Connection to Evostream failed
      class ConnectionFailed < RuntimeError
        def initialize
          puts 'Connection to Evostream REFUSED !!'.red
        end
      end

      # Response to evostream is empty
      class NoResult < RuntimeError
        def initialize
          puts 'No result for this command.'.yellow
        end
      end
    end
  end
end
