# frozen_string_literal: true

module Evostream
  module CLI
    # Search data in evostream result
    class Search
      def initialize(yaml_search)
        YAML.load(yaml_search).each do |key, value|
          @search = [key.to_sym, value]
        end
      end

      def search_node(result)
        YAML.load(result.to_yaml).each do |_key, value|
          inspect_array(value) if value.is_a?(Array) && !value.empty?
        end
      end

      private

      def inspect_array(evostream_response)
        evostream_response.each do |value|
          value.each do |hash_value|
            puts value.to_yaml if hash_value == @search
          end
        end
      end
    end
  end
end
