# Jupiter::Ag::Swap

programmatically swap on the largest solana dex aggregator by adding this gem to your project

## Install & Set up

Install the gem and add to the application's Gemfile by executing:

    $ bundle add jupiter-ag-swap

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install jupiter-ag-swap

Set the SWAP_API_URL environment variable or the [default will be used](https://www.jupiterapi.com/):

    $ export SWAP_API_URL=https://public.jupiterapi.com

## Usage

** Get a Quote **

```ruby
require 'jupiter/ag/swap/quote'

response = Jupiter::Ag::Swap::Quote.get({
  input_mint: 'So11111111111111111111111111111111111111112',
  output_mint: 'EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v',
  amount: 1000000,
  slippage_bps: 1
})
```

** Create a Swap **

> Note: You'll need the (Solana gem)[https://github.com/bitzlato/ruby-solana] and (Base58 gem)[https://github.com/dougal/base58] to create wallets.

```ruby
require 'solana'
require 'base58'
require 'jupiter/ag/swap/swap'

private_key = Base58.binary_from_base58(process.env['PRIVATE_KEY'] || '')
keypair = Solana::Keypair.new(private_key: private_key)
wallet = Solana::Wallet.new(keypair: keypair)

swap = Jupiter::Ag::Swap::Swap.post({
  quote_response: response['quoteResponse'],
  userPublicKey: wallet.keypair.pubkey.to_base58,
  wrapAndUnwrapSol: true
})
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chunky-metro/jupiter-ag-swap. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/chunky-metro/jupiter-ag-swap/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jupiter::Ag::Swap project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/chunky-metro/jupiter-ag-swap/blob/main/CODE_OF_CONDUCT.md).
