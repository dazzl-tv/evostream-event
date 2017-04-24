# frozen_string_literal: true

require 'sinatra/base'

# Fake class for testing response to pushCommand
class FakeEvostream < Sinatra::Base
  get '/pushStream' do
    json_response 200, :push_stream
  end

  get '/createDASHStream' do
    json_response 200, :create_dash_stream
  end

  get '/createHLSStream' do
    json_response 200, :create_hls_stream
  end

  get '/removeConfig' do
    json_response 200, :remove_config
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open("#{File.dirname(__FILE__)}/fixtures/#{file_name}.json")
  end
end
