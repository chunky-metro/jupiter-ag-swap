# frozen_string_literal: true

require_relative "lib/jupiter/ag/swap/version"

Gem::Specification.new do |spec|
  spec.name = "jupiter-ag-swap"
  spec.version = Jupiter::Ag::Swap::VERSION
  spec.authors = ["rhiza"]
  spec.email = ["rhiza@chunky.city"]

  spec.summary = "jup.ag swap"
  spec.description = "jup.ag swap"
  spec.homepage = "https://github.com/chunky-metro/jupiter-ag-swap"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  #spec.metadata["allowed_push_host"] = "https://rubygems.pkg.github.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/chunky-metro/jupiter-ag-swap"
  spec.metadata["source_code_uri"] = "https://github.com/chunky-metro/jupiter-ag-swap/tree/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "http", "~> 4.4"
  spec.add_dependency "activesupport", "~> 7.1"
  spec.add_dependency "redis", "~> 4.2"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
