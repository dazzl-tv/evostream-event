# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::Destroy do
  let(:command) { Evostream::Commands::PushStream }

  context 'uri' do
    let(:cmd) { { uri: 'rtmp://de.pscp.tv:80/x/31' } }

    include_examples 'command'
  end

  context 'local_stream_name' do
    let(:arg_value) { Faker::Pokemon.name }
    let(:argument) { 'local_stream_name' }

    include_examples 'command raise'
  end

  context 'target_stream_name' do
    let(:arg_value) { Faker::Pokemon.name }
    let(:argument) { 'target_stream_name' }

    include_examples 'command raise'
  end
end
