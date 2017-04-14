module RailsRackSessionCookie

  class Railtie < Rails::Railtie

    initializer 'rails-rack-session-cookie.configure_rails_initialization' do
      # Remove the egregious rails cookie store
      app.middleware.insert_before ActionDispatch::Cookies,

      app.middleware.delete ActionDispatch::Cookies
      app.middleware.delete ActionDispatch::Session::CookieStore
    end

    def app
      Rails.application
    end

  end

end
