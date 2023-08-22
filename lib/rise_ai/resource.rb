require "faraday"

module RiseAi
  class Resource
    def post_request(url, body:, headers: {})
      handle_response(connection.post(url, body, headers))
    end

    private

    def handle_response(response)
      error_message = response.body

      case response.status
      when 401
        raise Error, "Invalid authorization credentials: #{error_message}"
      when 404
        raise Error, "Not found: #{error_message}"
      when 422
        raise Error, "Unprocessable entity: #{error_message}"
      when 406
        raise Error,
          "Not acceptable. Missing mandatory fields: #{error_message}"
      when 409
        raise Error, "Conflict: #{error_message}"
      when 503
        raise Error, "Timed out: #{error_message}"
      end

      response
    end

    def connection
      @connection ||=
        Faraday.new do |conn|
          conn.request :json
          conn.adapter Faraday.default_adapter
        end
    end
  end
end
