# frozen_string_literal: true

module Evostream
  module Response
    # Return a response to JSON format
    class FormatJSON < Responses
      def message
        super.to_json
      end
    end
  end
end
