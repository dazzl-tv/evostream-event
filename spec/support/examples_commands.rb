# frozen_string_literal: true

require 'active_support/core_ext/string'

RSpec.shared_examples 'command' do
  let(:cmd) { { argument => arg_value } }
  let(:result) { "#{argument.camelize(:lower)}=#{arg_value} " }

  it do
    expect(command.instance_variable_get(:@command)[0] + ' ').to eql(result)
  end
end
