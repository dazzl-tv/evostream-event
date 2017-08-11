# frozen_string_literal: true

# :reek:TooManyMethods

module Evostream
  module Commands
    # Create flux HLS
    class CreateHLS < Create
      # Call default command for create DASH Stream
      def initialize(commands = {
        local_stream_names: 'null', target_folder: 'null'
      })
        super(commands)
      end

      def cmd
        super
        "createHLSStream?params=#{encode_64}"
      end

      private

      def create_master_playlist(param = 1)
        "createMasterPlaylist=#{param}"
      end

      # The manifest file name
      def playlist_name(param = 'playlist.m3u8')
        "playlistName=#{param}"
      end

      # This parameter represents the maximum length, in seconds, the EMS will
      # allow anysingle chunk to be. This is primarily in the case of
      # chunkOnIDR=true where the EMS will wait for the next key-frame. If the
      # maxChunkLength is less than chunkLength, the parameter shall be ignored
      def max_chunk_length(param = 0)
        "maxChunkLength=#{param}"
      end

      # The base name used to generate the *.ts chunks
      def chunk_base_name(param = 'segment')
        "chunkBaseName=#{param}"
      end

      # Sets the type of DRM encryption to use.  Options are: none (no
      # encryption), evo (AES Encryption), SAMPLE-AES (Sample-AES), verimatrix
      # (Verimatrix DRM). For Verimatrix DRM, the 'drm' section of the
      # config.lua file must be active and properly configured
      def drm_type(param = 'none')
        "drmType=#{param}"
      end

      # Specifies the number of keys that will be automatically generated and
      # rotated over while encrypting this HLS stream
      def aes_key_count(param = 5)
        "AESKeyCount=#{param}"
      end

      # Specifies if the resulting stream will be audio only. A value of 1(true)
      # will result in a stream without video
      def audio_only(param = 0)
        "audioOnly=#{param}"
      end

      # If true, HLS will resume in appending segments to previously created
      # childplaylist even in cases of EMS shutdown or cut off stream source
      def hls_resume(param = 0)
        "hlsResume=#{param}"
      end

      # If true, corresponding hls files to a stream will be deleted if the said
      # stream is removed or shut down or disconnected
      def cleanup_on_close(param = 0)
        "cleanupOnClose=#{param}"
      end

      # If true, will use the EXT-X-BYTERANGE feature of HLS (version 4 and up)
      def use_byte_range(param = 0)
        "useByteRange=#{param}"
      end

      # When using useByteRange=1, this parameter needs to be set too. This will
      # be the size of file before chunking it to another file, this replace the
      # chunkLength in case of EXT-X-BYTERANGE, since chunkLength will be the
      # byte range chunk
      def file_length(param = 0)
        "fileLength=#{param}"
      end

      # If true, uses UTC in playlist time stamp otherwise will use the local
      # server time
      def use_system_time(param = 0)
        "useSystemTime=#{param}"
      end

      def offset_time(param = 0)
        "offsetTime=#{param}"
      end

      # A parameter valid only for HLS v.6 onwards. This will indicate the start
      # offset time (in seconds) for the playback of the playlist
      def start_offset(param = 0)
        "startOffset=#{param}"
      end
    end
  end
end
