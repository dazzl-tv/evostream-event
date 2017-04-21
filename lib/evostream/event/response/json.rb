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
        @data = @evostream.body if @status.eql?(200)
      end

      def message
        {
          status: @status,
          message: @message,
          data: @data
        }.to_json
      end

      def data
        @data || ''
      end

      private

      attr_accessor :evostream

      # :reek:Nilcheck

      def define_status
        body = @evostream.body
        if @evostream['status'].eql?('FAIL') || defined? body && body.nil?
          500
        elsif !defined? body
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
    end
  end
end
