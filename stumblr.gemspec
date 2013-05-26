# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stumblr/version'

Gem::Specification.new do |spec|
  spec.name          = "stumblr"
  spec.version       = STumblr::VERSION
  spec.authors       = ["Bill Nelson"]
  spec.email         = ["wnelson@bitwiddle.com"]
  spec.description   = %q{Simple Read Only Tumblr Gem}
  spec.summary       = %q{Gem to read a Tumblr Blog}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "httparty"
end
