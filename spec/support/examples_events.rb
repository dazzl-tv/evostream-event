# frozen_string_literal: true

RSpec.shared_examples 'payload is correct' do
  include_examples 'body type'
  include_examples 'evostream::event new'
  include_examples 'instance variable model'
  it { expect(type).to eql(type_default) }
end

RSpec.shared_examples 'payload isn\'t correct' do
  include_examples 'body type'
  include_examples 'evostream::event new'
  include_examples 'instance variable model'
  it { expect(type).not_to eql(type_default) }
end

RSpec.shared_examples 'body type' do
  it { expect(body.to_json).to be_kind_of(String) }
end

RSpec.shared_examples 'evostream::event new' do
  it { expect(Evostream::Event.new(type, payload)).not_to be nil }
end

RSpec.shared_examples 'instance variable model' do
  let(:model) { type.sub(/^(\w)/, &:capitalize) }
  let(:evo) { Evostream::Event.new(type, payload) }

  it { expect(evo.instance_variable_get(:@model)).to eql(model) }
end
