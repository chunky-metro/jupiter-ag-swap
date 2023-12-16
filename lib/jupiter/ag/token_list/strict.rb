module Jupiter
  module Ag
    module TokenList
      class Strict
        def self.get
          $redis.get('token-list-strict') ||
            $redis.set('token-list-strict', HTTP.get(BASE_URL + "/strict"))
        end
      end
    end
  end
end
