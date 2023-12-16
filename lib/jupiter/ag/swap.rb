# frozen_string_literal: true

require_relative "swap/version"
require_relative "swap/quote"
require_relative "swap/indexed_route_map"

module Jupiter
  module Ag
    module Swap
      class Error < StandardError; end

      BASE_URL = "https://quote-api.jup.ag/v6"
    end
  end
end

$redis = Redis.new