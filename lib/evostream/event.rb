# frozen_string_literal: true

require 'active_support'
require 'evostream/event/info'
require 'evostream/event/service'
require 'evostream/event/commands'
require 'evostream/event/event'
require 'evostream/event/action'
require 'net/http'

# Primary command to gem
module Evostream
  def self.send_command_event(cmd)
    response = prepare_request(cmd)
    Evostream::Response::JSON.new(JSON.parse(response.body).to_hash).message
    # body = response.body.nil? ? {} : JSON.parse(response.body).to_hash
    # { status: Evostream.status(body), message: body['description'] }
  end

  def self.send_command_action(cmd)
    response = prepare_request(cmd)
    Evostream::Response::JSON.new(JSON.parse(response.body).to_hash).message
    # body = response.body
    # if body.blank?
    #   { status: 403, message: 'Error with evostream !' }
    # else
    #   body = JSON.parse(body).to_hash
    #   { status: 200, message: body['description'] }
    # end
  end

  def self.logger(message)
    Rails.logger.debug "[#{Evostream::GEM_NAME}] #{message}" if defined?(Rails)
  end

  def self.prepare_request(cmd)
    uri = URI.parse("#{Evostream::Service.uri_in}/#{cmd}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.request(Net::HTTP::Get.new(uri.request_uri))
  end
end
