# frozen_string_literal: true

module Evostream
  module Generators
    # Create a generator for Rails application
    class InitializerGenerator < Rails::Generators::Base
      desc 'Generate a initializer for evostream-event gem.'
      INITIALIZER = <<-INIT
  # frozen_string_literal: true

  Evostream::Service.configuration do |config|
    # URL to EvoStream for share video to final user
    config.uri_in       = 'http://server_stream.local:80'

    # URL to EvoStream for sending request to this API
    config.uri_out      = 'http://server_stream.local:7777'

    # Prefix to folder created for each video mangaed by EvoStream
    config.name         = 'srteamming_'

    # Folder for file created by EvoStream
    config.web_root     = '/var/www/html'

    # Name to model manipulate
    config.model        = ModelUsedInDatabase

    # Choose id to document manipulate in Database
    config.model_id     = :identifier_used_in_model

    # Use environment for this gem. Choose between :
    # - development   : Write in log and Send request to evoStream
    # - test          : Write in Log
    # - production    : Send request to EvoStream
    config.environement = :test
  end
      INIT

      # Create initializer in Rails project
      def copy_initializer
        initializer 'evostream_event.rb', INITIALIZER
      end
    end
  end
end
