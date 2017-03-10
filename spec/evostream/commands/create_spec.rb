# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::Create do
  let(:command) { Evostream::Commands::Create.new(cmd) }

  context 'local_stream_names' do
    let(:arg_value) { Faker::Pokemon.name }
    let(:argument) { 'local_stream_names' }

    include_examples 'command'
  end

  context 'target_folder' do
    let(:arg_value) { Faker::Pokemon.name }
    let(:argument) { 'target_folder' }

    include_examples 'command'
  end

  context 'bandwidths' do
    let(:arg_value) { Faker::Number.between(1, 99) }
    let(:argument) { 'bandwidths' }

    include_examples 'command'
  end

  context 'group_name' do
    let(:arg_value) { Faker::Pokemon.name }
    let(:argument) { 'group_name' }

    include_examples 'command'
  end

  context 'playlist_type' do
    let(:arg_value) { %w(appending rolling).sample }
    let(:argument) { 'playlist_type' }

    include_examples 'command'
  end

  context 'playlist_length' do
    let(:arg_value) { Faker::Number.between(1, 99) }
    let(:argument) { 'playlist_length' }

    include_examples 'command'
  end

  context 'chunk_length' do
    let(:arg_value) { Faker::Number.between(1, 99) }
    let(:argument) { 'chunk_length' }

    include_examples 'command'
  end

  context 'chunk_on_idr', broken: true do
    let(:arg_value) { Faker::Number.between(0, 1) }
    let(:argument) { 'chunk_on_idr' }

    include_examples 'command'
  end

  context 'keep_alive' do
    let(:arg_value) { Faker::Number.between(0, 1) }
    let(:argument) { 'keep_alive' }

    include_examples 'command'
  end

  context 'overwrite_destination' do
    let(:arg_value) { Faker::Number.between(0, 1) }
    let(:argument) { 'overwrite_destination' }

    include_examples 'command'
  end

  context 'stale_retention_count' do
    let(:arg_value) { Faker::Number.between(1, 99) }
    let(:argument) { 'stale_retention_count' }

    include_examples 'command'
  end

  context 'cleanup_destination' do
    let(:arg_value) { Faker::Number.between(0, 1) }
    let(:argument) { 'cleanup_destination' }

    include_examples 'command'
  end

  context 'dynamic_profile' do
    let(:arg_value) { Faker::Number.between(0, 1) }
    let(:argument) { 'dynamic_profile' }

    include_examples 'command'
  end
end
