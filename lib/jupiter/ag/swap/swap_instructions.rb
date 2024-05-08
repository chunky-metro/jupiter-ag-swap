require 'http'
require 'active_support/core_ext/hash'

module Jupiter
  module Ag
    module Swap
      class SwapInstructions
        def self.post(**params)
          params = camelize_keys(params)
          raise "Missing `quoteResponse`" unless params["quoteResponse"]

          HTTP.post(BASE_URL + "/swap-instructions", params: params).parse(:json)
        end

        private

        def self.camelize_keys(hash)
          hash.transform_keys { |key| key.to_s.camelize(:lower) }
        end
      end
    end
  end
end
