# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::Transcode do
  let(:command) { described_class }

  context 'when audio_bitrates' do
    let(:arg_value) { Faker::Games::Pokemon.name }
    let(:argument) { 'audio_bitrates' }

    include_examples 'command raise'
  end

  context 'with mandatory argument(s)' do
    let(:cmd) do
      {
        source: Faker::Coffee.variety,
        destinations: Faker::Games::Pokemon.name
      }
    end

    include_examples 'command'
  end
end
