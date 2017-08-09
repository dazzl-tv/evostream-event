# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::GetStreamInfo do
  let(:command) { Evostream::Commands::GetStreamInfo.new(cmd) }

  context 'id' do
    let(:arg_value) { Faker::Number.between(1, 999) }
    let(:argument) { 'id' }

    include_examples 'command'
  end

  context 'local_stream_name' do
    let(:arg_value) { Faker::Pokemon.name }
    let(:argument) { 'local_stream_name' }

    include_examples 'command'
  end
end
