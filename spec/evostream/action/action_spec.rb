# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Action, type: :request do
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

    context 'global Evostream variable' do
      include_examples 'test request action'
    end

    context 'local Evostream variable' do
      let(:action) { Evostream::Action.new(payload, 'evostream.dazzl.local') }

      include_examples 'test request action'
    end
  end

  describe 'remove_config' do
    let(:action_name) { 'removeConfig' }
    let(:payload) { { id: Faker::Number.between(1, 999_999) } }

    context 'global Evostream variable' do
      include_examples 'test request action'
    end

    context 'local Evostream variable' do
      let(:action) { Evostream::Action.new(payload, 'evostream.dazzl.local') }

      include_examples 'test request action'
    end
  end
end
