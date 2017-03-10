# frozen_string_literal: true

module Evostream
  # Gem Evostream::Event
  module Events
    # Class parent for all event
    class Event
      def initialize(id_flux)
        Evostream.logger "Initialize event #{class_name}"
        @id_flux = id_flux
        @model = Service.model.find_by(Service.model_id => id_flux)
      end

      def execute(type_flux = %w(hls dash))
        Evostream.logger "Execute action for event #{class_name}"
        type_flux.each { |flux| yield(flux) } if block_given?
      end

      def class_name
        self.class.name.demodulize
      end

      def self.descendants
        ObjectSpace.each_object(Class).select { |klass| klass < self }
      end

      private

      attr_reader :id_flux, :model
    end
  end
end

require 'evostream/events/in_stream_created'
require 'evostream/events/in_stream_closed'
require 'evostream/events/out_stream_created'
