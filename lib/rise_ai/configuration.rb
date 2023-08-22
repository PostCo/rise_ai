# frozen_string_literal: true

module RiseAi
  class Configuration
    attr_accessor :client_secret, :client_id

    def self.setup
      new.tap { |instance| yield(instance) if block_given? }
    end
  end
end
