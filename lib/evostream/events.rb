# frozen_string_literal: true

module Evostream
  # Gem Evostream::Event
  module Events
    # Class parent for all event
    class Event
      def initialize(id_flux)
        Rails.logger.debug "[#{Evostream::GEM_NAME}] Initialize " \
          "event #{self.class.name.demodulize}"
        @id_flux = id_flux
      end

      def execute(type_flux = %w(hls dash))
        Rails.logger.debug "[#{Evostream::GEM_NAME}] Execute action " \
          "for event #{slef.class.name.demodulize}"
        type_flux.each { |flux| yield(flux) } if block_given?
      end

      private

      attr_reader :id_flux
    end
  end
end

require 'evostream/events/in_stream_created'
require 'evostream/events/in_stream_closed'
require 'evostream/events/out_stream_created'
