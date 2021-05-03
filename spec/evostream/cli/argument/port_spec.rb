# frozen_string_literal: true

require 'spec_helper'

describe Evostream::CLI::Argument::Port, type: :cli do
  before { ARGV.push('--port') }

  after { ARGV.pop }

  let(:runner) { Evostream::Runner.new }

  context 'when argument with port dont given' do
    let(:out) { /Command is invalid !!/ }
    let(:code) { 101 }

    include_examples 'argument exit'
    include_examples 'argument output'
  end

  context 'when argumentw with port given', broken: true do
    before { ARGV.push(5489) }

    after { ARGV.pop }

    let(:out) { /No command executed !! No command precise\./ }
    let(:code) { 100 }

    include_examples 'argument exit'
    include_examples 'argument output'
  end
end
