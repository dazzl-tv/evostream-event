# frozen_string_literal: true

module Net
  # Override Net::hTTPResponse for create response with body
  class HTTPResponse
    def self.mock(body = {})
      # construct
      clazz = self
      response = clazz.new('1.1', '200', 'OK')

      # inject
      response.instance_variable_set :@body, body

      # mockulate
      response.instance_eval 'def body; @body; end'

      response
    end
  end
end
