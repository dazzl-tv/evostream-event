# frozen_string_literal: true

require 'active_support'
require 'evostream/event'
require 'faker'
require 'json'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

Dir['spec/support/**/*.rb'].each do |f|
  require File.expand_path(f)
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Exclude spec broken
  config.filter_run_excluding broken: true
end
