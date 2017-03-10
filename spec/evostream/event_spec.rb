# frozen_string_literal: true

require 'spec_helper'

describe Evostream do
  it 'has a version number' do
    expect(Evostream::VERSION).not_to be nil
  end

  it 'has a gem name' do
    expect(Evostream::GEM_NAME).not_to be nil
  end

  it 'has a authors' do
    expect(Evostream::AUTHORS).not_to be nil
  end

  it 'has a emails' do
    expect(Evostream::EMAILS).not_to be nil
  end

  it 'has a license' do
    expect(Evostream::LICENSE).not_to be nil
  end

  it 'has a summary' do
    expect(Evostream::SUMMARY).not_to be nil
  end

  it 'has a description' do
    expect(Evostream::DESCRIPTION).not_to be nil
  end

  it 'has a homepage' do
    expect(Evostream::HOMEPAGE).not_to be nil
  end

  it 'has a post install message' do
    expect(Evostream::POST_INSTALL).not_to be nil
  end
end
