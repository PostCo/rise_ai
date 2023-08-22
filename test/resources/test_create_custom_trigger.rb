# frozen_string_literal: true

require "test_helper"

class TestCreateCustomTrigger < Minitest::Test
  def setup
    RiseAi.client_secret = ENV.fetch("RISE_AI_CLIENT_SECRET")
  end

  def test_custom_trigger_creation
    VCR.use_cassette("create_custom_trigger") do
      response =
        RiseAi::CustomTrigger.create(
          ENV.fetch("RISE_AI_TEST_SHOPIFY_DOMAIN"),
          {
            client_id: ENV.fetch("RISE_AI_CLIENT_ID"),
            scheme: {
              variables: [
                {
                  path: "customer_email",
                  type: "Email",
                  title: "Customer Email"
                },
                {path: "credit_amount", type: "Float", title: "Credit Amount"}
              ],
              meta: {
                title: "PostCo Trigger",
                description: "Generate Rise.ai store credit for PostCo Return"
              }
            }
          }
        )
      data = JSON.parse(response.body, symbolize_names: true)[:trigger]
      refute_nil data[:id]
      refute_nil data[:trigger_id]
      assert_equal(ENV.fetch("RISE_AI_TEST_SHOPIFY_DOMAIN"), data[:shop_url])
      assert_equal(
        [
          {path: "customer_email", type: "Email", title: "Customer Email"},
          {path: "credit_amount", type: "Float", title: "Credit Amount"}
        ],
        data[:variables]
      )
      assert_equal(
        {
          title: "PostCo Trigger",
          description: "Generate Rise.ai store credit for PostCo Return",
          source: "Postco"
        },
        data[:meta]
      )
    end
  end
end
