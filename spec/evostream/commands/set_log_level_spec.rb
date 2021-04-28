# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::SetLogLevel do
  let(:command) { Evostream::Commands::SetLogLevel }

  context 'level' do
    let(:cmd) { { level: Faker::Number.between(from: 0, to: 6).to_s } }

    include_examples 'command'
  end
end
