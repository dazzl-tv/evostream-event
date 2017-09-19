# frozen_string_literal: true

module Evostream
  module CLI
    module Argument
      # Abstract class for all argument used with CLI command
      class Arg
        def self.descendants
          ObjectSpace.each_object(Class).select { |klass| klass < self }
        end

        def used?
          action if use(self.class::KEY)
        end

        private

        def use(argument_parsed)
          argument_parsed.any? { |value| ARGV.include?(value) }
        end

        def action
          raise CodeError::Finished
        end

        def parameter(search_case)
          param = ARGV.find_index(search_case)
          ARGV[param + 1]
        end
      end
    end
  end
end

require 'option/help'
require 'option/command'
require 'option/host'
require 'option/port'
require 'option/search'
require 'option/config'
require 'option/version'
