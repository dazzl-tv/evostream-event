# frozen_string_literal: true

module Evostream
  module Generators
    # Create a generator for Rails application
    class InitializerGenerator < Rails::Generators::Base
      desc 'Generate a initializer for evostream-event gem.'
      INITIALIZER = <<-INIT
# frozen_string_literal: true

Evostream::Service.configuration do |config|
  config.uri_in     = 'http://server_stream.local:80'
  config.uri_out    = 'http://server_stream.local:7777'
  config.name       = 'srteamming_'
  config.web_root   = '/var/www/html'
  config.model      = ModelUsedInDatabase
  config.model_id   = :identifier_used_in_model
end
      INIT

      # Create initializer in Rails project
      def copy_initializer
        initializer 'evostream_event.rb', INITIALIZER
      end
    end
  end
end
