require 'http'
require 'active_support/core_ext/hash'

module Jupiter
  class Quote
    def self.get(**params)
      HTTP.get(BASE_URL + "/quote", params: camelize_keys(params)).parse(:json)
    end
  end
end
