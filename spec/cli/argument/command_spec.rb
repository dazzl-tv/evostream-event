# frozen_string_literal: true

require 'spec_helper'

describe Evostream::CLI::Argument::Command do
  let(:runner) { Evostream::Runner.new }

  it do
    ARGV << '-c'
    expect(runner.run).to eql(0)
  end

  it do
    expect { runner.run }.to output(/.*Commands :.*/).to_stdout
  end
end
