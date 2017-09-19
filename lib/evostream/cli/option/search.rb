# frozen_string_literal: true

module Evostream
  module CLI
    module Argument
      # Argument for searching in response to command
      class Search < Arg
        include Singleton

        KEY = ['-s', '--search'].freeze

        attr_reader :search

        def initialize
          @search = nil
        end

        private

        def action
          KEY.each do |search|
            @search = parameter(search) if args_has_present?(search)
          end
        end

        def args_has_present?(ind)
          ARGV.find_index(ind)
        end
      end
    end
  end
end
