# frozen_string_literal: true

module Jupiter
  class Error < StandardError; end

  BASE_URL = "https://quote-api.jup.ag/v6"

  def self.camelize_keys(hash)
    hash.transform_keys { |key| key.to_s.camelize(:lower) }
  end
end