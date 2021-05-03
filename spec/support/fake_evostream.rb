# frozen_string_literal: true

require 'webmock/rspec'

# Fake class for testing response to pushCommand
class FakeEvostream
  def self.request
    WebMock::API.stub_request(:any, /server_stream.local/)
  end

  def self.push_stream
    request.to_return(json_response(:push_stream))
  end

  def self.remove_config
    request.to_return(json_response(:remove_config))
  end

  def self.json_response(file_name)
    {
      status: 200,
      headers: { 'Content-Type': 'application/json' },
      body: File.open("#{File.dirname(__FILE__)}/fixtures/#{file_name}.json")
    }
  end
end
