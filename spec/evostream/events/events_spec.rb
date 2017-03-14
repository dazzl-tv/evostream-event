# frozen_string_literal: true

require 'spec_helper'

describe Evostream::Events::Event do
  it 'has a three childern class' do
    expect(Evostream::Events::Event.descendants.count).to eql(3)
  end
end
