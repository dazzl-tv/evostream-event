# frozen_string_literal: true

require 'spec_helper'

describe Evostream::CLI::Argument::Host do
  before { ARGV.push('--server') }
  after { ARGV.pop }

  let(:runner) { Evostream::Runner.new }

  context 'when argument with host dont given' do
    let(:out) { /Command is invalid !!/ }
    let(:code) { 101 }

    include_examples 'argument exit'
    include_examples 'argument output'
  end

  context 'when argument with host given' do
    before { ARGV.push('127.0.0.1') }
    after { ARGV.pop }

    let(:out) { /Connection to Evostream REFUSED !!/ }
    let(:code) { 201 }

    include_examples 'argument exit'
    include_examples 'argument output'
  end
end
