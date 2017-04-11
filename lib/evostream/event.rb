# frozen_string_literal: true

require 'active_support'
require 'evostream/event/info'
require 'evostream/event/service'
require 'evostream/event/commands'
require 'evostream/event/events'
require 'net/http'

# :reek:DuplicateMethod

# Primary command to gem
module Evostream
  def self.send_command(cmd)
    response = prepare_request(cmd)
    body = response.body.nil? ? {} : JSON.parse(response.body).to_hash
    { status: Evostream.status(body), message: body['description'] }
  end

  def self.send_command_action(cmd)
    response = prepare_request(cmd)
    body = response.body
    if body.blank?
      { status: 403, message: 'Error with evostream !' }
    else
      body = JSON.parse(body).to_hash
      { status: 200, message: body['description'] }
    end
  end

  def self.logger(message)
    Rails.logger.debug "[#{Evostream::GEM_NAME}] #{message}" if defined?(Rails)
  end

  def self.status(body)
    if body['status'].eql?('FAIL')
      403
    elsif body.empty?
      204
    else
      200
    end
  end

  def self.prepare_request(cmd)
    uri = URI.parse("#{Evostream::Service.uri_in}/#{cmd}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.request(Net::HTTP::Get.new(uri.request_uri))
  end
end

module Evostream
  # Send an action to evostream server
  class Action
    def initialize(payload)
      @payload = payload
    end

    def execute_action(command_name)
      cmd = command_name.sub(/^(\w)/, &:capitalize)
      klass = "Evostream::Commands::#{cmd}".constantize
      Evostream.send_command_action(klass.new(@payload).cmd)
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
