# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::Create do
  let(:command) { described_class }

  context 'when bandwidths' do
    let(:arg_value) { Faker::Number.between(from: 1, to: 99) }
    let(:argument) { 'bandwidths' }

    include_examples 'command raise'
  end

  context 'when group_name' do
    let(:arg_value) { Faker::Games::Pokemon.name }
    let(:argument) { 'group_name' }

    include_examples 'command raise'
  end

  context 'when playlist_type' do
    let(:arg_value) { %w[appending rolling].sample }
    let(:argument) { 'playlist_type' }

    include_examples 'command raise'
  end

  context 'when playlist_length' do
    let(:arg_value) { Faker::Number.between(from: 1, to: 99) }
    let(:argument) { 'playlist_length' }

    include_examples 'command raise'
  end

  context 'when chunk_length' do
    let(:arg_value) { Faker::Number.between(from: 1, to: 99) }
    let(:argument) { 'chunk_length' }

    include_examples 'command raise'
  end

  context 'when chunk_on_idr', broken: true do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'chunk_on_idr' }

    include_examples 'command raise'
  end

  context 'when keep_alive' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'keep_alive' }

    include_examples 'command raise'
  end

  context 'when overwrite_destination' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'overwrite_destination' }

    include_examples 'command raise'
  end

  context 'when stale_retention_count' do
    let(:arg_value) { Faker::Number.between(from: 1, to: 99) }
    let(:argument) { 'stale_retention_count' }

    include_examples 'command raise'
  end

  context 'when cleanup_destination' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'cleanup_destination' }

    include_examples 'command raise'
  end

  context 'when dynamic_profile' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'dynamic_profile' }

    include_examples 'command raise'
  end

  context 'with mandatory argument(s)' do
    let(:cmd) do
      {
        local_stream_names: Faker::Games::Pokemon.name,
        target_folder: Faker::File.file_name(dir: '/path/to')
      }
    end

    include_examples 'command'
  end
end
