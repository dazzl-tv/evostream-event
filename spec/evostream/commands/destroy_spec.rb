# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::Destroy do
  let(:command) { described_class }

  context 'when id' do
    let(:cmd) { { id: Faker::Number.between(from: 1, to: 99).to_s } }

    include_examples 'command'
  end

  context 'when remove_hls_hds_files' do
    let(:arg_value) { Faker::Number.between(from: 0, to: 1) }
    let(:argument) { 'remove_hls_hds_files' }

    include_examples 'command raise'
  end

  context 'when group_name' do
    let(:arg_value) { Faker::Games::Pokemon.name }
    let(:argument) { 'group_name' }

    include_examples 'command raise'
  end
end
