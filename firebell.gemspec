# coding: utf-8
# lib = File.expand_path('../lib', __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/firebell/version'

Gem::Specification.new do |spec|
  spec.name          = "firebell"
  spec.version       = Firebell::VERSION
  spec.authors       = ["Luke Carpenter"]
  spec.email         = ["x@rubynerd.net"]
  spec.summary       = %q{Push notifications as a service}
  spec.description   = %q{A ruby client for https://firebellapp.com - push notifications as a service}
  spec.homepage      = "https://github.com/ghostworks/firebell"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "mocha"
end
