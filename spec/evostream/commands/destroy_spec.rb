# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::Destroy do
  let(:command) { Evostream::Commands::Destroy.new(cmd) }

  context 'id' do
    let(:arg_value) { Faker::Number.between(1, 99) }
    let(:argument) { 'id' }

    include_examples 'command'
  end

  context 'remove_hls_hds_files' do
    let(:arg_value) { Faker::Number.between(0, 1) }
    let(:argument) { 'remove_hls_hds_files' }

    include_examples 'command'
  end

  context 'group_name' do
    let(:arg_value) { Faker::Pokemon.name }
    let(:argument) { 'group_name' }

    include_examples 'command'
  end
end
