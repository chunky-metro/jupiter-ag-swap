# frozen_string_literal: true

require_relative "swap/version"
require_relative "swap/quote"
require_relative "swap/indexed_route_map"
require_relative "token_list"
require_relative "models"

module Jupiter
  module Ag
    module Swap
      class Error < StandardError; end

      BASE_URL = "https://public.jupiterapi.com"
    end
  end
end

$redis = Redis.new