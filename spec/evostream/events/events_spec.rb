# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Events::Event do
  it 'has a three childern class' do
    expect(described_class.descendants.count).to be(3)
  end
end
