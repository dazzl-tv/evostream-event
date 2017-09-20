# frozen_string_literal: true

require 'spec_helper'

describe Evostream::CLI::Argument::Command do
  let(:runner) { Evostream::Runner.new }
  let(:out) { /Commands :\n^  - .*/ }
  let(:code) { 0 }

  context 'when short argument' do
    before { ARGV.push('-c') }
    after { ARGV.pop }

    include_examples 'argument exit'
    include_examples 'argument output'
  end

  context 'when long argument' do
    before { ARGV.push('--commands') }
    after { ARGV.pop }

    include_examples 'argument exit'
    include_examples 'argument output'
  end
end
