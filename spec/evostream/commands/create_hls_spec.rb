# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::CreateHLS do
  let(:command) { described_class }

  context 'when create_master_playlist' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'create_master_playlist' }

    include_examples 'command raise'
  end

  context 'when playlist_name' do
    let(:arg_value) { Faker::Games::Pokemon.name }
    let(:argument) { 'playlist_name' }

    include_examples 'command raise'
  end

  context 'when max_chunk_length' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'max_chunk_length' }

    include_examples 'command raise'
  end

  context 'when chunk_base_name' do
    let(:arg_value) { Faker::Games::Pokemon.name }
    let(:argument) { 'chunk_base_name' }

    include_examples 'command raise'
  end

  context 'when drm_type' do
    let(:arg_value) { Faker::Games::Pokemon.name }
    let(:argument) { 'drm_type' }

    include_examples 'command raise'
  end

  context 'when aes_key_count', broken: true do
    let(:arg_value) { Faker::Number.between(from: 1, to: 99) }
    let(:argument) { 'aes_key_count' }

    include_examples 'command raise'
  end

  context 'when audio_only' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'audio_only' }

    include_examples 'command raise'
  end

  context 'when hls_resume' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'hls_resume' }

    include_examples 'command raise'
  end

  context 'when cleanup_on_close' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'cleanup_on_close' }

    include_examples 'command raise'
  end

  context 'when use_byte_range' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'use_byte_range' }

    include_examples 'command raise'
  end

  context 'when file_length' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'file_length' }

    include_examples 'command raise'
  end

  context 'when use_system_time' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'use_system_time' }

    include_examples 'command raise'
  end

  context 'when offset_time' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'offset_time' }

    include_examples 'command raise'
  end

  context 'when start_offset' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'start_offset' }

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
