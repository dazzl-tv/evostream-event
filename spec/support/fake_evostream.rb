# frozen_string_literal: true

require 'sinatra/base'

# Fake class for testing response to pushCommand
class FakeEvostream < Sinatra::Base
  get '/pushStream?cmd=:parameters' do
    json_response 200, 'push_stream.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb')
  end
end
