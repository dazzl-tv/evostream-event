# frozen_string_literal: true

require 'evostream/info'
require 'evostream/service'
require 'evostream/commands'
require 'evostream/events'

# Primary command to gem
module Evostream
  def self.send_command(cmd)
    uri = URI.parse(Evostream::Service.uri_in)
    http = Net::HTTP.new(uri.host, uri.port)
    http.request(Net::HTTP::Get.new("/#{cmd}"))
  end
end
