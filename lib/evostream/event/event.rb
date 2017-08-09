# frozen_string_literal: true

require 'evostream/event/event/events'

module Evostream
  # Reacts to event
  class Event
    EVENTS = Evostream::Events::Event.descendants

    def initialize(type, payload)
      @payload = payload
      @model = type.sub(/^(\w)/, &:capitalize)
    end

    def execute_action
      klass = "Evostream::Events::#{@model}".constantize
      Evostream.logger "Execute Action : #{klass}"
      execute_klass(klass) if EVENTS.include?(klass)
    end

    private

    def execute_klass(klass)
      name_flux = extract_name_flux
      Evostream.logger "Name Flux : #{name_flux}"
      Evostream.logger "Event : #{klass}"
      case [klass]
      when [Evostream::Events::OutStreamCreated]
        klass.new(name_flux, @payload).execute
      else
        # when [Evostream::Events::InStreamCreated]
        # when [Evostream::Events::InStreamClosed]
        klass.new(name_flux).execute
      end
    end

    def extract_name_flux
      @payload[:name].gsub(Evostream::Service.name, '')
    end
  end
end
