# frozen_string_literal: true

module Evostream
  module Events
    # Action inStreamClosed
    class InStreamClosed < Event
      def initialize(id_flux, config = {})
        super(id_flux)
        @config = config
      end

      def execute
        super do |type_flux|
          klass = Evostream::Commands::Destroy.new(remove_config(type_flux))
          Evostream.send_command(klass.cmd)
          yield if block_given?
        end
      end

      private

      attr_reader :config

      def remove_config(flux)
        if @config.empty?
          {
            group_name: "#{Evostream::Service.name}#{flux}",
            remove_hls_hds_files: 1
          }
        else
          @config
        end
      end
    end
  end
end
