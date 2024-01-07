require 'spec_helper'

RSpec.describe Jupiter::Ag::TokenList::Strict do
  describe '.get' do
    it 'returns the token list' do
      VCR.use_cassette("strict_get") do
        response = described_class.get
        expect(response).not_to be_nil
        # Add more specific expectations based on your requirements
      end
    end
  end
end
