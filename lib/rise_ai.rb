# frozen_string_literal: true

require_relative "rise_ai/version"
require "zeitwerk"
require "forwardable"

loader = Zeitwerk::Loader.for_gem
loader.collapse("#{__dir__}/rise_ai/objects")
loader.collapse("#{__dir__}/rise_ai/resources")
loader.setup

module RiseAi
  @config = Configuration.setup

  class << self
    extend Forwardable

    attr_reader :config

    # User configurable options
    def_delegators :@config, :client_secret, :client_secret=
  end
end
