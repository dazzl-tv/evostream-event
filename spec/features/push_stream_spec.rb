# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'PushStream', type: :response,
                             name: :pushCommand do
  uri = URI('http://server_stream.local/pushCommand')

  response = JSON.parse(Net::HTTP.get(uri))

  expect(response['data']['configId']).to eq(6)
end
