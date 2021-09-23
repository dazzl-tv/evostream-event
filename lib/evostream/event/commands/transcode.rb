# frozen_string_literal: true

module Evostream
  module Commands
    # Send command transcode
    # @see https://docs.evostream.com/2.0/transcode.html
    class Transcode < Command
      MANDATORY = %w[source destinations].freeze

      def initialize(commands = {
        source: 'null', destinations: 'null'
      })
        super(commands)
      end

      def cmd
        super
        "transcode?params=#{encode64}"
      end

      private

      attr_reader :command

      def source(param)
        "source=#{param}"
      end

      def group_name(param)
        "groupName=#{param}"
      end

      def video_bitrates(param)
        "videoBitrates=#{param}"
      end

      def audio_bitrates(param)
        "audioBitrates=#{param}"
      end

      def destinations(param = 'null')
        "destinations=#{param}"
      end
    end
  end
end
