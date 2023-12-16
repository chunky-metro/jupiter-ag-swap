require 'http'
require 'active_support/core_ext/hash'

module Jupiter
  module Ag
    module Swap
      class Quote
        def self.get(**params)
          HTTP.get(BASE_URL + "/quote", params: camelize_keys(params)).parse(:json)
        end

        def self.post(**params)
          HTTP.post(BASE_URL + "/quote", json: camelize_keys(params)).parse(:json)
        end

        private

        def self.camelize_keys(hash)
          hash.transform_keys { |key| key.to_s.camelize(:lower) }
        end
      end
    end
  end
end
