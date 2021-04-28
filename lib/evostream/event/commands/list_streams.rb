# frozen_string_literal: true

module Evostream
  module Commands
    # Provides a detailed description of all active streams.
    class ListStreams < Command
      MANDATORY = [].freeze

      def initialize(commands = {})
        super(commands)
      end

      def cmd
        super
        "listStreams?params=#{encode64}"
      end

      private

      attr_reader :command

      # If this is 1 (true), internal streams (origin-edge related)
      # are filtered out from the list
      def disable_internal_streams(param = 'true')
        "disableInternalStreams=#{param}"
      end
    end
  end
end
