# frozen_string_literal: true

require 'spec_helper'

feature 'RemoveConfig', type: :response,
                        name: :removeConfig do
  it do
    uri = URI('http://server_stream.local/removeConfig?params=dXJpPXJ0')

    response = JSON.parse(Net::HTTP.get(uri))

    expect(response['data']['configId']).to eq(6)
  end
end
