# frozen_string_literal: true

module Evostream
  module Events
    # Action OutStreamCreated
    class OutStreamCreated < Event
      def initialize(id_flux, request)
        super(id_flux)
        @request = request
      end

      def execute
        super
        stream = what_flux.constantize
        model.streams.push(stream.new(config_id: ex_config, flux: ex_flux))
      end

      private

      def what_flux
        @request.key?('hlsSettings') ? 'Hls' : 'Dash'
      end

      def name_flux
        case what_flux
        when 'Hls' then 'playlistName'
        when 'Dash' then 'manifestName'
        end
      end

      def name_settings
        @request["#{what_flux.downcase}Settings"]
      end

      def ex_config
        name_settings['configId']
      end

      def ex_flux
        Evostream::Service.uri_out + '/' + name_settings['groupName'] + '/' +
          @request['name'] + '/' + name_settings[name_flux]
      end
    end
  end
end
