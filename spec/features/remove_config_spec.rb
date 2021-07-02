# frozen_string_literal: true

require 'spec_helper'

describe 'RemoveConfig', type: :request,
                         name: :removeConfig do
  before { FakeEvostream.remove_config }

  it do
    uri = URI('http://server_stream.local/removeConfig?params=dXJpPXJ0')

    response = JSON.parse(Net::HTTP.get(uri))

    expect(response['data']['configId']).to eq(6)
  end
end
