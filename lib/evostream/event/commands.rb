# frozen_string_literal: true

# :reek:UncommunicativeMethodName

module Evostream
  # Manage command
  module Commands
    # Class parent for all command
    class Command
      def initialize(commands = {})
        @command = []
        commands.each do |command_name, command_param|
          @command.push send(command_name, command_param)
        end
      end

      def cmd
        Evostream.logger "Command before encode : #{@command}"
      end

      private

      # Encode commands in base 64 with space between each command
      def encode_64
        Base64.strict_encode64(@command.join(' '))
      end
    end
  end
end

require 'evostream/event/commands/create'
require 'evostream/event/commands/destroy'
require 'evostream/event/commands/get_stream_info'
require 'evostream/event/commands/list_config'
require 'evostream/event/commands/list_streams'
require 'evostream/event/commands/push_stream'
