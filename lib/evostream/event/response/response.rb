# frozen_string_literal: true

module Evostream
  module Response
    # Return a response to JSON format
    class JSON
      attr_reader :status, :message, :data

      def initialize(evostream_response)
        @evostream = evostream_response.body

        @status = define_status
        @message = define_message
        @data = @evostream['data'] if @status.eql?(200)
      end

      def message
        {
          status: @status,
          message: @message,
          data: @data.to_hash
        }.with_indifferent_access
      end

      def data
        @data || ''
      end

      private

      attr_accessor :evostream

      def define_status
        case @evostream['status']
        when 'FAIL' then 500
        when 'SUCCESS' then 200
        end
      end

      def define_message
        if @status.eql?(500)
          'Error with EvoStream server.'
        else
          'Object was successfully created/updated.'
        end
      end
    end
  end
end
