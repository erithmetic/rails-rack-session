# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-rack-session/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-rack-session"
  spec.version       = RailsRackSession::VERSION
  spec.authors       = ["Derek Kastner"]
  spec.email         = ["dkastner@gmail.com"]

  spec.summary       = %q{Use classic Rack::Session::Cookie in Rails}
  spec.description   = %q{Enable sessions/cookies in Rails that are compatible with standard rack apps}
  spec.homepage      = "http://github.com/dkastner/rails-rack-session"

  spec.files         = Dir['README.md', 'lib/**/*']
  spec.require_paths = ["lib"]

  spec.add_dependency 'rack', '~> 2.0.1'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
