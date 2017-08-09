# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::ListStreams do
  let(:command) { Evostream::Commands::ListStreams.new(cmd) }

  context 'disable_internal_streams' do
    let(:arg_value) { Faker::Boolean.boolean }
    let(:argument) { 'disable_internal_streams' }

    include_examples 'command'
  end
end
