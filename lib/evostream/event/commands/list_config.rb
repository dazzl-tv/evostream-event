# frozen_string_literal: true

module Evostream
  module Commands
    # Returns a list with all push/pull configurations.
    #
    # Whenever the pullStream or pushStream interfaces are called, a record
    # containing the details of the pull or push is created in the
    # pullpushconfig.xml file. Then, the next time the EMS is started, the
    # pullpushconfig.xml file is read, and the EMS attempts to reconnect all of
    # the previous pulled or pushed streams.
    #
    # This function has no parameters.
    class ListConfig < Command
      def initialize(commands = {})
        super(commands)
      end

      def cmd
        'listConfig'
      end
    end
  end
end
