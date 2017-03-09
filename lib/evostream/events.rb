# frozen_string_literal: true

module Evostream
  # Gem Evostream::Event
  module Events
    # Class parent for all event
    class Event
      def initialize
        Rails.logger.debug "[#{Evostream::GEM_NAME}] Initialize " \
          "event #{self.class.name.demodulize}"
      end

      def execute
        Rails.logger.debug "[#{Evostream::GEM_NAME}] Execute action " \
          "for event #{slef.class.name.demodulize}"
        yield
      end
    end
  end
end

require 'evostream/events/in_stream_created'
require 'evostream/events/in_stream_closed'
require 'evostream/events/out_stream_created'
