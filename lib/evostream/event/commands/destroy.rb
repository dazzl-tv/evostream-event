# frozen_string_literal: true

module Evostream
  # Concern all command sending to evoStream
  module Commands
    # Abstract class for create element
    class Destroy < Command
      def initialize(commands = { group_name: 'null', remove_hls_hds_files: 1 })
        super(commands)
      end

      def cmd
        super
        "removeConfig?params=#{encode_64}"
      end

      private

      attr_reader :command

      # The configId of the configuration that needs to be removed. ConfigIds
      # can be obtained from the listConfig interface. Removing an inbound
      # stream will also automatically remove all associated outbound streams.
      def id(param = 'null')
        "id=#{param}"
      end

      # The name of the group that needs to be removed (applicable to HLS, HDS
      # and external processes). *Mandatory only if the id parameter is not
      # specified.
      def group_name(param = 'null')
        "groupName=#{param}"
      end

      # If 1 (true) and the stream is HLS or HDS, the folder associated with it
      # will be removed
      def remove_hls_hds_files(param = 0)
        "removeHlsHdsFiles=#{param}"
      end
    end

    # Alias to Destroy class
    RemoveConfig = Destroy
  end
end
