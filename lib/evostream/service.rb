# frozen_string_literal: true

# :reek:Attribute

module Evostream
  # DSL configuration for this gem
  class Service
    attr_writer :uri, :name, :webroot

    def initialize(&block)
      instance_eval(&block) if block_given?
    end
  end
end
