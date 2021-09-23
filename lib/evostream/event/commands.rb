# frozen_string_literal: true

require 'base64'

# :reek:UncommunicativeMethodName
# :reek:NestedIterators
# :reek:DuplicateMethodCall

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
        test_missing_parameter
      end

      def cmd
        Evostream.logger "Command before encode : #{@command}"
      end

      def self.descendants
        ObjectSpace.each_object(Class).select { |klass| klass < self }
      end

      private

      # Encode commands in base 64 with space between each command
      def encode64
        Base64.strict_encode64(@command.join(' '))
      end

      def test_missing_parameter
        missing = self.class::MANDATORY.empty? ? false : missing_parameter
        raise Errors::MissingMandatory.new(self.class::MANDATORY, self.class) \
          if missing
      end

      def missing_parameter
        self.class::MANDATORY.none? do |method|
          @command.any? do |part_payload|
            part_payload.match?(/#{method}/)
          end
        end
      end
    end
  end
end

require 'evostream/event/commands/error'
require 'evostream/event/commands/create'
require 'evostream/event/commands/destroy'
require 'evostream/event/commands/get_stream_info'
require 'evostream/event/commands/list_config'
require 'evostream/event/commands/list_streams'
require 'evostream/event/commands/push_stream'
require 'evostream/event/commands/set_log_level'
require 'evostream/event/commands/transcode'
