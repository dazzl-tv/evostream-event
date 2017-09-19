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
          path = parameter('--config')
          CLI::Config.instance.load_custom_file(File.join(path))
        rescue
          raise CodeError::Syntax::OptionInvalid
        end
      end
    end
  end
end
