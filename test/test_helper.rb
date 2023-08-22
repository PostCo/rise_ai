# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "rise_ai"
require "dotenv/load"
require "pry"
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :faraday
  config.allow_http_connections_when_no_cassette = true
end

require "minitest/autorun"
