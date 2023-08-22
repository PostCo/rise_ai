# frozen_string_literal: true

require "test_helper"

class TestCreateCustomTrigger < Minitest::Test
  def setup
    RiseAi.client_secret = ENV.fetch("RISE_AI_CLIENT_SECRET")
    RiseAi.client_id = ENV.fetch("RISE_AI_CLIENT_ID")
  end

  def test_custom_trigger_creation
    VCR.use_cassette("create_custom_trigger") do
      response =
        RiseAi::CustomTrigger.create(
          ENV.fetch("RISE_AI_TEST_SHOPIFY_DOMAIN"),
          {
            client_id: RiseAi.config.client_id,
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
      refute_nil response["id"]
      refute_nil response["trigger_id"]
      assert_equal(
        ENV.fetch("RISE_AI_TEST_SHOPIFY_DOMAIN"),
        response["shop_url"]
      )
      assert_equal(
        [
          {
            "path" => "customer_email",
            "type" => "Email",
            "title" => "Customer Email"
          },
          {
            "path" => "credit_amount",
            "type" => "Float",
            "title" => "Credit Amount"
          }
        ],
        response["variables"]
      )
      assert_equal(
        {
          "title" => "PostCo Trigger",
          "description" => "Generate Rise.ai store credit for PostCo Return",
          "source" => "Postco"
        },
        response["meta"]
      )
    end
  end
end
