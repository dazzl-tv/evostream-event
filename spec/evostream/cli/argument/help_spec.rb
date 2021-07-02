# frozen_string_literal: true

require 'spec_helper'

describe Evostream::CLI::Argument::Help do
  after { ARGV.pop }

  let(:runner) { Evostream::Runner.new }
  let(:out) do
    File.read(File.join(__dir__, '..', '..', '..', '..',
                        'lib', 'evostream', 'cli', 'option', 'help'))
  end
  let(:code) { 0 }

  context 'when short argument' do
    before { ARGV.push('-h') }

    include_examples 'argument help'
  end

  context 'when long argument' do
    before { ARGV.push('--help') }

    include_examples 'argument help'
  end
end
