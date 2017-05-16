# frozen_string_literal: true

# :reek:Attribute
# :reek:ClassVariable

module Evostream
  # DSL configuration for this gem
  class Service
    mattr_accessor :web_root, :uri_in, :uri_out, :name, :model, :model_id,
                   :environment

    def self.configuration(&block)
      block.call(self)
    end

    # Environment for this gem
    # :test         -- Dont send command to EvoStream instance
    # :production   -- Execute command HTTP
    def self.environment
      @@environment || :test
    end

    def self.web_root
      @@web_root || '/var/www/html'
    end
  end
end
