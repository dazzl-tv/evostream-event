# frozen_string_literal: true

require 'active_support/hash_with_indifferent_access'

module Evostream
  # Create a response
  class Responses
    attr_reader :status, :message, :data

    def initialize(evostream_response)
      @evostream = JSON.parse(evostream_response.body)

      @status = define_status
      @message = define_message
      @data = @evostream['data'] if @status.eql?(200)
    end

    def message
      {
        status: @status,
        message: @message,
        data: @data
      }.deep_symbolize_keys!
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
