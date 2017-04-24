# frozen_string_literal: true

require 'spec_helper'

feature 'PushStream', type: :response,
                      name: :pushStream do
  it do
    uri = URI('http://server_stream.local/pushStream?params=dXJpPXJ0')

    response = JSON.parse(Net::HTTP.get(uri))

    expect(response['data']['configId']).to eq(6)
  end
end
