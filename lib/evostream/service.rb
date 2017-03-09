# frozen_string_literal: true

module Evostream
  module Event
    # DSL configuration for this gem
    class Service
      attr_writer :uri

      def initialize(&block)
        instance_eval(&block) if block_given?
      end
    end
  end
end
