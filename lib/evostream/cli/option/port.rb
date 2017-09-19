# frozen_string_literal: true

module Evostream
  module CLI
    module Argument
      # Argument for change port used with command
      class Port < Arg
        include Singleton

        KEY = ['--port'].freeze

        private

        def action
          CLI::Config.instance.change_host(parameter('--port'))
        end
      end
    end
  end
end
