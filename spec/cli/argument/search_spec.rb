# frozen_string_literal: true

require 'spec_helper'

describe Evostream::CLI::Argument::Search do
  let(:runner) { Evostream::Runner.new }

  context 'when short argument' do
    before { ARGV.push('--search') }
    after { ARGV.pop }

    context 'when argument with file dont exit' do
      let(:out) { /No command executed !! No command precise\./ }
      let(:code) { 100 }

      include_examples 'argument exit'
      include_examples 'argument output'
    end

    context 'when argument with exit file' do
      before { ARGV.push('.travis/evostream-configuration.yml') }
      after { ARGV.pop }

      let(:out) { /Connection to Evostream REFUSED !!/ }
      let(:code) { 201 }

      include_examples 'argument exit'
      include_examples 'argument output'
    end
  end

  context 'when long argument' do
    before { ARGV.push('-s') }
    after { ARGV.pop }
  end
end
