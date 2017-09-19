# frozen_string_literal: true

module Evostream
  module CLI
    module Argument
      # Argument for listing command available in this software
      class Command < Arg
        include Singleton

        KEY = ['-c', '--commands'].freeze

        private

        def action
          $stdout.puts 'Commands :'
          Evostream::Commands::Command.descendants.each do |cmd|
            $stdout.puts "  - #{cmd.to_s.split('::').last}"
          end
          super
        end
      end
    end
  end
end
