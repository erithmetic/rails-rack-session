module RailsRackSessionCookie

  class Railtie < Rails::Railtie

    initializer 'rails-rack-session-cookie.configure_rails_initialization' do
      # Remove the egregious rails cookie store
      app.middleware.insert_before ActionDispatch::Cookies,
        Rack::Session::Cookie,
        secret: SecretGarden.fetch!('SECRET_KEY_BASE'),
        key: '_faraday_session',
        domain: ENV.fetch('COOKIE_DOMAIN')

      app.middleware.delete ActionDispatch::Cookies
      app.middleware.delete ActionDispatch::Session::CookieStore
    end

    def app
      Rails.application
    end

  end

end
