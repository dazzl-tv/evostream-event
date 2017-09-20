# frozen_string_literal: true

module Evostream
  module CLI
    module Argument
      # Argument for display version
      class Version < Arg
        include Singleton

        KEY = ['-v', '--version'].freeze

        private

        def action
          txt = <<~INFO
            ##################################
            # Ruby -- #{RUBY_VERSION}
            # Evostream::Event -- #{Evostream::VERSION}
            ##################################
          INFO
          $stdout.puts txt
          super
        end
      end
    end
  end
end
