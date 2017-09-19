# frozen_string_literal: true

module Evostream
  module CLI
    module Argument
      # Argument for change host used with command calling
      class Host < Arg
        include Singleton

        KEY = ['--server'].freeze

        private

        def action
          CLI::Config.instance.change_host(parameter('--server'))
        end
      end
    end
  end
end
