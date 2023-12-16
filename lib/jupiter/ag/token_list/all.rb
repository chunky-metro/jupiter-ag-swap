module Jupiter
  module Ag
    module TokenList
      class All
        def self.get
          $redis.get('token-list-all') ||
            $redis.set('token-list-all', HTTP.get(BASE_URL + "/all"))
        end
      end
    end
  end
end
