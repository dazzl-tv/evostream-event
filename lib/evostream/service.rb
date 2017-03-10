# frozen_string_literal: true

# :reek:Attribute

module Evostream
  # DSL configuration for this gem
  class Service
    mattr_accessor :web_root, :uri_in, :uri_out, :name

    def self.config(&block)
      block.call(self)
    end
  end
end
