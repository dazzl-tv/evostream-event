# frozen_string_literal: true

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
    end
  end
end

require 'evostream/event/commands/create'
require 'evostream/event/commands/destroy'
