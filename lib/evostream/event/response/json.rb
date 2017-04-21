# frozen_string_literal: true

module Evostream
  module Response
    # Return a response to JSON format
    class JSON
      attr_reader :status, :message, :data

      def initialize(evostream_response)
        @evostream = evostream_response

        @status = define_status
        @message = define_message
        @data = define_data
      end

      def message
        {
          status: @status,
          message: @message,
          body: @data
        }.to_json
      end

      def data
        @data || ''
      end

      private

      attr_accessor :evostream

      def define_status
        if @evostream['status'].eql?('FAIL')
          500
        elsif @evostream.empty?
          204
        else
          200
        end
      end

      def define_message
        if @status.eql?(500)
          'Error with EvoStream server.'
        elsif @status.eql?(204)
          'Object was successfully created.'
        else
          'Object was successfully updated.'
        end
      end

      def define_data
        @data = @evostream.body unless @status.eql?(500) || @status.eql?(204)
        Evostream.logger "Response evostram : #{@data.inspect}"
      end
    end
  end
end
