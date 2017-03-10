# frozen_string_literal: true

module Evostream
  module Events
    # Action inStreamCreated
    class InStreamCreated < Event
      def execute
        super do |type_flux|
          klass = "Evostream::Commands::Create#{type_flux.upcase}".constantize
          command = send(type_flux, type_flux)
          Evostream.send_command(klass.new(command).cmd)
        end
      end

      private

      def hls(flux)
        {
          local_stream_names: stream_name,
          target_folder: target_folder(flux),
          cleanup_destination: 1,
          group_name: group_name(flux),
          keep_alive: 1,
          chunk_length: 1,
          playlist_length: 10,
          playlist_type: 'rolling'
        }
      end

      alias dash hls

      def target_folder(flux)
        "#{Evostream::Service.web_root}#{group_name(flux)}/#{stream_name}"
      end

      def group_name(type_flux)
        "#{Evostream::Service.name}_#{type_flux}"
      end

      def stream_name
        "#{Evostream::Service.name}_#{id_flux}"
      end
    end
  end
end
