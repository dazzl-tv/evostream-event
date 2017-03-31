# frozen_string_literal: true

module Evostream
  module Commands
    # This will try to push a local stream to an external destination. The
    # pushed stream can only use the RTMP, RTSP or MPEG-TS unicast/multicast
    # protocol.
    class PushStream < Command
      def initialize(commands = {})
        super(commands)
      end

      def cmd
        "pushStream?params=#{Base64.urlsafe_encode64(command.join)}"
      end

      private

      attr_reader :command

      # TheURI of the external stream. Can be RTMP, RTSP or unicast/multicast
      # (d) mpegts
      def uri(param = 'null')
        "uri=#{param} "
      end

      # If provided, the stream will be given this name. Otherwise, a fallback
      # techniqueis used to determine the stream name (based on the URI)
      def local_stream_name(param = '')
        "localStreamName=#{param} "
      end

      # The name of the stream at destination. If not provided, the target
      # stream name willbe the same as the local stream name
      def target_stream_name(param = 'null')
        "targetStreamName=#{param} "
      end
    end
  end
end
