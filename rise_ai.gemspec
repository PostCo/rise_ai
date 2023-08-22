# frozen_string_literal: true

require_relative "lib/rise_ai/version"

Gem::Specification.new do |spec|
  spec.name = "rise_ai"
  spec.version = RiseAi::VERSION
  spec.authors = ["Wei Zhe Heng"]
  spec.email = ["marcushwz@gmail.com"]

  spec.summary = "Rise.ai API Wrapper"
  spec.homepage = "https://github.com/PostCo/rise_ai"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/PostCo/rise_ai"
  spec.metadata["changelog_uri"] = "https://github.com/PostCo/rise_ai/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "zeitwerk", "~> 2.6.11"
  spec.add_dependency "faraday", "~> 2.7.10"
  spec.add_dependency "jwt", "~> 2.7.1"
  spec.add_development_dependency("standard", "~> 1.25.0")
  spec.add_development_dependency("dotenv", "~> 2.8.1")
  spec.add_development_dependency("pry", "~> 0.14.2")
  spec.add_development_dependency("vcr", "~> 6.2.0")
end
