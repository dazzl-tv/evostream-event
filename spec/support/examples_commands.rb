# frozen_string_literal: true

require 'active_support/core_ext/string'

RSpec.shared_examples 'command' do
  let(:test) do
    test = []
    var = command.new(cmd).instance_variable_get(:@command)
    cmd.each_with_index do |_value, index|
      test << var[index].split('=').last
    end
    test
  end
  let(:to) do
    to = []
    cmd.each { |value| to << value.last }
    to
  end

  it { expect(test).to eql(to) }
end

RSpec.shared_examples 'command raise' do
  let(:cmd) { { argument => arg_value } }

  it do
    expect { command.new(cmd) }.to \
      raise_error(Evostream::Commands::Errors::MissingMandatory)
  end
end
