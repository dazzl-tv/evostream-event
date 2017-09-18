# frozen_string_literal: true

module Evostream
  # Send an action to evostream server
  class Action
    def initialize(payload = {})
      @payload = payload
    end

    def execute_action(command_name)
      cmd = command_name.sub(/^(\w)/, &:capitalize)
      klass = get_class(cmd)

      Evostream.logger "Execute action with cmd : #{klass}"
      Evostream.send_command(klass.new(@payload).cmd)
    end

    private

    def get_class(cmd)
      "Evostream::Commands::#{cmd}".constantize
    rescue
      message = "Command [#{cmd}] dosen't exist."
      puts message
      Evostream.logger message
    end
  end
end
