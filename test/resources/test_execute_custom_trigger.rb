# frozen_string_literal: true

require "test_helper"

class TestExecuteCustomTrigger < Minitest::Test
  def setup
    RiseAi.client_secret = ENV.fetch("RISE_AI_CLIENT_SECRET")
  end

  def test_custom_trigger_execution
    VCR.use_cassette("execute_custom_trigger") do
      response = RiseAi::CustomTrigger.execute(
        "25b9554d-0bda-402f-bd17-b49eb16b979d",
        {customer_email: "marcus@postco.io", credit_amount: 100}
      )
      assert_equal(202, response.status)
    end
  end
end
