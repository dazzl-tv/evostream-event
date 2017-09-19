# frozen_string_literal: true

require 'spec_helper'

describe Evostream::CLI::Argument::Help do
  let(:runner) { Evostream::Runner.new }
  let(:out) do
    file = File.join(__dir__, '..', '..', '..', 'lib', 'evostream', 'cli', 'option', 'help')
    File.read(file)
  end
  let(:code) { 0 }

  context 'when short argument' do
    before { ARGV.push('-h') }
    after { ARGV.pop }

    include_examples 'argument exit'
    include_examples 'argument output'
  end

  context 'when long argument' do
    before { ARGV.push('-h') }
    after { ARGV.pop }

    include_examples 'argument exit'
    include_examples 'argument output'
  end
end
