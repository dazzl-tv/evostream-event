# frozen_string_literal: true

require 'active_support'
require 'evostream/event/info'
require 'evostream/event/service'
require 'evostream/event/commands'
require 'evostream/event/events'
require 'net/http'

# Primary command to gem
module Evostream
  def self.send_command(cmd)
    uri = URI.parse("#{Evostream::Service.uri_in}/#{cmd}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.request(Net::HTTP::Get.new(uri.request_uri))
  end

  def self.logger(message)
    Rails.logger.debug "[#{Evostream::GEM_NAME}] #{message}" if defined?(Rails)
  end

  # Send an action to evostream server
  class Action
    def initialize(payload)
      @payload = payload
    end

    def execute_action(command_name)
      cmd = command_name.sub(/^(\w)/, &:capitalize)
      klass = "Evostream::Commands::#{cmd}".constantize
      Evostream.send_command(klass.new(@payload).cmd)
    end
  end

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
