# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Commands::SetLogLevel do
  let(:command) { Evostream::Commands::SetLogLevel.new(cmd) }

  context 'level' do
    let(:arg_value) { Faker::Number.between(0, 6) }
    let(:argument) { 'level' }

    include_examples 'command'
  end
end
