# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::CreateDASH do
  let(:command) { Evostream::Commands::CreateDASH.new(cmd) }

  context 'manifest_name' do
    let(:arg_value) { Faker::Pokemon.name }
    let(:argument) { 'manifest_name' }

    include_examples 'command'
  end
end
