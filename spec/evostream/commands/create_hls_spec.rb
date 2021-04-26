# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::CreateHLS do
  let(:command) { Evostream::Commands::CreateHLS }

  context 'create_master_playlist' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'create_master_playlist' }

    include_examples 'command raise'
  end

  context 'playlist_name' do
    let(:arg_value) { Faker::Games::Pokemon.name }
    let(:argument) { 'playlist_name' }

    include_examples 'command raise'
  end

  context 'max_chunk_length' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'max_chunk_length' }

    include_examples 'command raise'
  end

  context 'chunk_base_name' do
    let(:arg_value) { Faker::Games::Pokemon.name }
    let(:argument) { 'chunk_base_name' }

    include_examples 'command raise'
  end

  context 'drm_type' do
    let(:arg_value) { Faker::Games::Pokemon.name }
    let(:argument) { 'drm_type' }

    include_examples 'command raise'
  end

  context 'aes_key_count', broken: true do
    let(:arg_value) { Faker::Number.between(from: 1, to: 99) }
    let(:argument) { 'aes_key_count' }

    include_examples 'command raise'
  end

  context 'audio_only' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'audio_only' }

    include_examples 'command raise'
  end

  context 'hls_resume' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'hls_resume' }

    include_examples 'command raise'
  end

  context 'cleanup_on_close' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'cleanup_on_close' }

    include_examples 'command raise'
  end

  context 'use_byte_range' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'use_byte_range' }

    include_examples 'command raise'
  end

  context 'file_length' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'file_length' }

    include_examples 'command raise'
  end

  context 'use_system_time' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'use_system_time' }

    include_examples 'command raise'
  end

  context 'offset_time' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'offset_time' }

    include_examples 'command raise'
  end

  context 'start_offset' do
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
