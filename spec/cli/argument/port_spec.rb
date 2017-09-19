# frozen_string_literal: true

require 'spec_helper'

describe Evostream::CLI::Argument::Port do
  before { ARGV.push('--port') }
  after { ARGV.pop }

  let(:runner) { Evostream::Runner.new }

  context 'when argument with host dont given' do
    let(:out) { /Command is invalid !!/ }
    let(:code) { 101 }

    include_examples 'argument exit'
    include_examples 'argument output'
  end

  context 'when argumentw with host given' do
    before { ARGV.push('5489') }
    after { ARGV.pop }

    let(:out) { /Connection to Evostream REFUSED !!/ }
    let(:code) { 201 }

    include_examples 'argument exit'
    include_examples 'argument output'
  end
end
