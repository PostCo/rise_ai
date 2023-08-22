# frozen_string_literal: true

require "jwt"

module RiseAi
  class CustomTrigger < Resource
    BASE_URL = "https://workflows.rise-ai.com/"

    def self.create(shopify_domain, body)
      url = BASE_URL + "triggers?shop_url=#{shopify_domain}"
      payload = {"shop_url" => shopify_domain}
      token = JWT.encode(payload, RiseAi.config.client_secret, "HS256")
      headers = {"Authorization" => "Bearer #{token}"}

      CustomTrigger.new.post_request(url, body: body, headers: headers)
    end

    def self.execute(trigger_key, body)
      url = BASE_URL + "execute/#{trigger_key}"

      CustomTrigger.new.post_request(url, body: body)
    end
  end
end
