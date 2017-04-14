require 'rack'

module RailsRackSession

  # Configure this plugin with:
  #
  # config.rack_session store: :cookie,
  #   key: '_my_app',
  #   domain: '.example.com'
  #
  # Use the same keys used to configure Rack::Session
  # For cookie store, see http://www.rubydoc.info/gems/rack/Rack/Session/Cookie
  class Railtie < Rails::Railtie

    initializer 'rack_session' do
      cfg = config.respond_to?(:rack_session) ? config.rack_session : {}

      if cfg[:store].nil?
        raise <<-TXT
You must choose a session storage class using:
  config.rack_session store: <class>

Available options: :cookie, :pool, :memcache
        TXT
      end

      cfg[:secret] ||= app.secrets[:secret_key_base]

      puts cfg.inspect

      session_class = Rack::Session.const_get cfg.delete(:store).to_s.camelize

      app.middleware.insert_before ActionDispatch::Cookies, session_class, cfg

      app.middleware.delete ActionDispatch::Cookies
      app.middleware.delete ActionDispatch::Session::CookieStore
    end

    def app
      Rails.application
    end

  end

end
