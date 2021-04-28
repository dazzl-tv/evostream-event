# frozen_string_literal: true

module Evostream
  module Commands
    # Returns a detailed set of information about a stream.
    class GetStreamInfo < Command
      MANDATORY = %w[id].freeze

      def initialize(commands = {})
        super(commands)
      end

      def cmd
        super
        "getStreamInfo?params=#{encode64}"
      end

      private

      # The uniqueId of the stream. Usually a value returned by listStreamsIDs.
      # This parameter is not mandatory but either this or the localStreamName
      # should be present to identify the particular stream
      def id(param = 'null')
        "id=#{param}"
      end

      # The name of the stream. This parameter is not mandatory but either this
      # or the id should be present to identify the particular stream
      def local_stream_name(param = '')
        "localStreamName=#{param}"
      end
    end
  end
end
