# frozen_string_literal: true

require 'spec_helper'

describe Evostream::CLI::Argument::Version do
  let(:runner) { Evostream::Runner.new }
  let(:out) { /##################################\n^# Ruby --.*\n^# Evostream::Event -- .*\n##################################/m }
  let(:code) { 0 }

  context 'when short argument' do
    before { ARGV.push('-v') }

    after { ARGV.pop }

    include_examples 'argument exit'
    include_examples 'argument output'
  end

  context 'when long argument' do
    before { ARGV.push('--version') }

    after { ARGV.pop }

    include_examples 'argument exit'
    include_examples 'argument output'
  end
end
