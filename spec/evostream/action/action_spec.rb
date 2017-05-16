# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Action, type: :request, broken: true do
  let(:action) { Evostream::Action.new(payload) }
  let(:payload) { {} }

  it 'should be a hash' do
    expect(action.instance_variable_get(:@payload)).to be_kind_of(Hash)
  end

  describe 'push_stream' do
    let(:action_name) { 'pushStream' }
    let(:payload) do
      {
        uri: 'rtmp://rtmp-api.facebook.com:80/rtmp',
        target_stream_name: '151146928743762?ds=1&s_l=1&a=AThF12FC86-ffgS5',
        local_stream_name: 'top'
      }
    end

    include_examples 'test request action'
  end

  describe 'remove_config' do
    let(:action_name) { 'removeConfig' }
    let(:payload) { { id: Faker::Number.between(1, 999_999) } }

    include_examples 'test request action'
  end
end
