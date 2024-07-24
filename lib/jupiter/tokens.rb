module Jupiter
  module Tokens
    def self.get
      $redis.get('token-list-all') ||
        $redis.set('token-list-all', HTTP.get(BASE_URL + "/tokens"))
    end

    class Token
      attr_accessor :address, :chain_id, :decimals, :name, :symbol, :logo_uri, :tags, :extensions
    
      def initialize(address:, chain_id:, decimals:, name:, symbol:, logo_uri:, tags:, extensions: [])
        @address = address
        @chain_id = chain_id
        @decimals = decimals
        @name = name
        @symbol = symbol
        @logo_uri = logo_uri
        @tags = tags
        @extensions = extensions
      end
    
      def self.find_by_address(address)
        token = all.find { |token| token['address'] == address }.transform_keys { |key| key.to_s.underscore.to_sym }
        new(**token)
      end
    
      def self.find_by_symbol(symbol)
        token = all.find { |token| token['symbol'] == symbol }.transform_keys { |key| key.to_s.underscore.to_sym }
        new(**token)
      end
    
      def self.all
        JSON.parse(TokenList::All.get)
      end
    end
  end
end


