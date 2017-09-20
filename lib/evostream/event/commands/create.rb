# frozen_string_literal: true

module Evostream
  # Concern all command sending to evoStream
  module Commands
    # Abstract class for create element
    class Create < Command
      MANDATORY = %w[localStreamNames targetFolder].freeze

      def initialize(commands = {})
        super(commands)
      end

      private

      attr_reader :command

      # The stream(s) that will be used as the input. This is a comma-delimited
      # list of active stream names (local stream names)
      def local_stream_names(param = 'null')
        "localStreamNames=#{param}"
      end

      # The folder where all the manifest and fragment files will be stored.
      # This folder must be accessible by the DASH clients. It is usually in the
      # web-root of the server
      def target_folder(param = 'null')
        "targetFolder=#{param}"
      end

      # The corresponding bandwidths for each stream listed in localStreamNames.
      # Again, this can be a comma-delimited list
      def bandwidths(param = 0)
        "bandwidths=#{param}"
      end

      # The name assigned to the DASH stream or group. If the localStreamNames
      # parameter contains only one entry and groupName is not specified,
      # groupName will have the value of the input stream name
      def group_name(param)
        "groupName=#{param}"
      end

      # Either `appending` or `rolling`
      def playlist_type(param = 'appending')
        "playlistType=#{param}"
      end

      # The number of fragments before the server starts to overwrite the older
      # fragments. Used only when playlistType is 'rolling'. Ignored otherwise
      def playlist_length(param = 10)
        "playlistLength=#{param}"
      end

      # The length (in seconds) of fragments to be made
      def chunk_length(param = 10)
        "chunkLength=#{param}"
      end

      # If true, chunking is performed ONLY on IDR. Otherwise, chunking is
      # performed whenever chunk length is achieved
      def chunk_on_idr(param = 1)
        "chunkOnIDR=#{param}"
      end

      # If true, the EMS will attempt to reconnect to the stream source if the
      # connection is severed
      def keep_alive(param = 1)
        "keepAlive=#{param}"
      end

      # If true, it will allow overwrite of destination files
      def overwrite_destination(param = 1)
        "overwriteDestination=#{param}"
      end

      # How many old files are kept besides the ones present in the current
      # version of the playlist. Only applicable for rolling playlists
      def stale_retention_count(param)
        "staleRetentionCount=#{param}"
      end

      # If true, all manifest and fragment files in the target folder will be
      # removed before DASH creation is started
      def cleanup_destination(param = 0)
        "cleanupDestination=#{param}"
      end

      # Set this parameter to 1 (default) for a live DASH, otherwise set it to 0
      # for a VOD
      def dynamic_profile(param = 1)
        "dynamicProfile=#{param}"
      end
    end
  end
end

require 'evostream/event/commands/create/dash'
require 'evostream/event/commands/create/hls'
