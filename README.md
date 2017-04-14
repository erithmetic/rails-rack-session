# RailsRackSessionCookie

By default, Rails 4+ comes with its own custom cookie storage mechanism that
encrypts cookie values. It is incompatible with Rack::Session::Cookie and only
necessary if you're storing sensitive information in your cookies (an
antipattern). 

This gem allows you to seemlessly share a cookie among rack-based web
applications, provided they all use the built-in Rack::Session middleware.

## How does it work?

This simply replaces the ActionDispatch cookie middleware with
Rack::Session::Storage. Unfortunately you cannot run ActionDispatch's cookie
middleware alongside Rack::Session::Storage because ActionDispatch overwrites
`env['rack.session']` with its custom cookie jar.

By using this gem, all your rack and rails apps must use Rack::Session::Storage
in order to share cookies.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails-rack-session'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails-rack-session

## Configuration

In config/application.rb:

```
config.rack_session = {
  store: :cookie,
  key: '_my_app',
  domain: '.example.com'
}
```

The `:store` key corresponds to the name of a `Rack::Session` class, e.g. `Cookie`.
the `:secret` key is inferred from your app's `secret_key_base`, usually set in
`config/secrets.yml`.

An optional `:coder` key can be given. By default, this is the
Rack::Session::Cookie::Base64::JSON coder that serializes session data as JSON.
This is more secure than Rack::Session's default marshalled hash.

Use the same keys used to configure Rack::Session. For cookie store, see
http://www.rubydoc.info/gems/rack/Rack/Session/Cookie

## Usage

This is a seamless drop-in as Rails' interface with the cookie store is
compatible with Rack::Session::Cookie.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dkastner/rails-rack-session.

