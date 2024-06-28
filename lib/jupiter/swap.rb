# frozen_string_literal: true

module Jupiter
  module Swap
    def self.post(**params)
      HTTP.post(BASE_URL + "/swap", json: camelize_keys(params)).parse(:json)
    end
  end
end

$redis = Redis.new