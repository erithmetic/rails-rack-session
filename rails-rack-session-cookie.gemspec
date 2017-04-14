# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-rack-session-cookie/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-rack-session-cookie"
  spec.version       = Rails::Rack::Session::Cookie::VERSION
  spec.authors       = ["Derek Kastner"]
  spec.email         = ["dkastner@gmail.com"]

  spec.summary       = %q{Use classic Rack::Session::Cookie in Rails}
  spec.description   = %q{Enable cookies in Rails that are compatible with standard rack apps}
  spec.homepage      = "http://github.com/dkastner/rails-rack-session-cookie"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir['README.md', 'lib/**/*']
  spec.require_paths = ["lib"]

  spec.add_dependency 'rack', '~> 2.0.1'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
