# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::ListStreams do
  let(:command) { described_class }

  context 'when disable_internal_streams' do
    let(:cmd) { { disable_internal_streams: Faker::Boolean.boolean.to_s } }

    include_examples 'command'
  end
end
