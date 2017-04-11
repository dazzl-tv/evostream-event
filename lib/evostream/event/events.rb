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
        @result = nil
      end

      def execute(type_flux = %w[hls dash])
        Evostream.logger "Execute action for event #{class_name}"
        type_flux.each { |flux| yield(flux) } if block_given?
        @result
      end

      def class_name
        self.class.name.demodulize
      end

      def self.descendants
        ObjectSpace.each_object(Class).select { |klass| klass < self }
      end

      def self.all_event
        descendants.collect do |klass|
          klass.to_s.split('::').last.camelize(:lower)
        end
      end

      private

      attr_reader :id_flux, :model
      attr_accessor :result
    end
  end
end

require 'evostream/event/events/in_stream_created'
require 'evostream/event/events/in_stream_closed'
require 'evostream/event/events/out_stream_created'
