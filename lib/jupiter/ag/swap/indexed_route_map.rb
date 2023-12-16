require 'http'
require 'redis'

module Jupiter
  module Ag
    module Swap
      class IndexedRouteMap
        def self.get
          $redis.get('route-map') ||
            $redis.set('route-map', HTTP.get(BASE_URL + "/indexed-route-map"))
        end

        def self.mint_keys
          $redis.get('mint-keys') || $redis.set('mint-keys', JSON.parse(get)['mintKeys'])
        end
      end
    end
  end
end
