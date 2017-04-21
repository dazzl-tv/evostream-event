# frozen_string_literal: true

require 'active_support'
require 'evostream/event'
require 'faker'
require 'json'
require 'webmock/rspec'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

Dir['spec/support/**/*.rb'].each do |f|
  require File.expand_path(f)
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Exclude spec broken
  config.filter_run_excluding broken: true

  # Configure Service DSL
  config.before do
    Evostream::Service.configuration do |c|
      c.uri_in     = 'http://server_stream.local:80'
      c.uri_out    = 'http://server_stream.local:7777'
      c.name       = 'srteamming_'
      c.web_root   = '/var/www/html'
      c.model      = Test
      c.model_id   = :identifier_used_in_model
    end
  end

  # Disable all remote connections
  WebMock.disable_net_connect!(allow_localhost: true)

  # Configure test Net::HTTP
  config.before(:each, type: :request) do
    stub_request(:get, /server_stream.local/)
      .with(headers: { 'Accept': '*/*', 'User-Agent': 'Ruby' })
      .to_return(status: 200, body: '', headers: {})
  end

  config.before(:each, type: :response) do
    stub_request(:any, /server_stream.local/).to_rack(FakeEvostream)
  end
end

# Class for testing
class Test
  def self.find_by(id)
    id
  end
end

# Class for testing model stream
class Hls; end

# Class for testing model stream
class Dash; end
