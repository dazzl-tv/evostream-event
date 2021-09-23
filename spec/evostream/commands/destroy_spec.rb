# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::Destroy do
  let(:command) { described_class }

  context 'when id' do
    let(:cmd) { { id: Faker::Number.between(from: 1, to: 99).to_s } }

    include_examples 'command'
  end

  context 'when remove_hls_hds_files' do
    let(:cmd) { { remove_hls_hds_files: Faker::Number.between(from: 0, to: 1).to_s } }

    include_examples 'command'
  end

  context 'when group_name' do
    let(:cmd) { { group_name: Faker::Games::Pokemon.name } }

    include_examples 'command'
  end
end
