# frozen_string_literal: true

module Evostream
  module Commands
    # Create flux DASH
    class CreateDASH < Create
      MANDATORY = %w[localStreamNames targetFolder].freeze

      # Call default command for create DASH Stream
      def initialize(commands = {
        local_stream_names: 'null', target_folder: 'null'
      })
        super(commands)
      end

      def cmd
        super
        "createDASHStream?params=#{encode64}"
      end

      private

      # The manifest file name
      def manifest_name(param = 'manifest.mpd')
        "manifestName=#{param}"
      end
    end
  end
end
