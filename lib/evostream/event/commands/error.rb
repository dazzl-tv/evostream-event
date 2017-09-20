# frozen_string_literal: true

module Evostream
  module Commands
    module Errors
      # Exception if command have no mandatory parameter
      class MissingMandatory < StandardError
        def initialize(arg_mandatory, klass)
          super "Parameter missing(s) #{arg_mandatory} in #{klass}"
        end
      end
    end
  end
end
