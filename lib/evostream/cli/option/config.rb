# frozen_string_literal: true

module Evostream
  module CLI
    module Argument
      # Argument for precise configuration file used
      class Config < Arg
        include Singleton

        KEY = ['--config'].freeze

        private

        def action
          file = File.join(parameter('--config'))
          CLI::Config.instance.load_custom_file(file)
        end
      end
    end
  end
end
