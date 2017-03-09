# frozen_string_literal: true

# :reek:Attribute

module Evostream
  # DSL configuration for this gem
  class Service
    attr_writer :uri_in, :uri_out, :name, :webroot

    def initialize(&block)
      instance_eval(&block) if block_given?
    end
  end
end
