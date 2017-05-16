# frozen_string_literal: true

module Evostream
  # Send an action to evostream server
  class Action
    def initialize(payload = {})
      @payload = payload
    end

    def execute_action(command_name)
      cmd = command_name.sub(/^(\w)/, &:capitalize)
      klass = "Evostream::Commands::#{cmd}".constantize
      Evostream.send_command(klass.new(@payload).cmd)
    end
  end
end
