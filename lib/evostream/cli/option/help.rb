# frozen_string_literal: true

module Evostream
  module CLI
    module Argument
      # Argument for display help
      class Help < Arg
        include Singleton

        KEY = ['-h', '--help'].freeze

        def initialize
          @file = File.read(File.join(__dir__, 'help'))
        end

        private

        def action
          puts @file
          super
        end
      end
    end
  end
end
