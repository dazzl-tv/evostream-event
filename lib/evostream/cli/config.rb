# frozen_string_literal: true

require 'erb'

module Evostream
  module CLI
    # Configuration file for CLI
    class Config
      def initialize
        @options = @uri = nil
        load_file_configuration
        Evostream::Service.environment = :production
        apply_uri
      end

      def change_host(host)
        @uri.host = host
        apply_uri
      end

      def change_port(port)
        @uri.port = port
        apply_uri
      end

      def load_custom_file(file)
        load_yml(file)
        save_uri
        apply_uri
      end

      private

      def apply_uri
        Evostream::Service.uri_in = @uri
      end

      def load_yml(file)
        @options = YAML.safe_load(ERB.new(File.read(file)).result)
      end

      def load_file_configuration
        load_yml(File.join(ENV['HOME'], '.evostream-configuration.yml'))
        save_uri
      end

      def save_uri
        @uri = URI.parse("http://#{options_host}:#{options_port}")
      end

      def options_host
        @options['evostream']['host']
      end

      def options_port
        @options['evostream']['port']
      end
    end
  end
end
