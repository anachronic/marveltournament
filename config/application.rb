require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Marveltournament
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    
    # Especifique en MINUTOS
    config.intervalo_peleas = 10

    # Haremos un job para encolar peleas
    config.after_initialize do
      if defined?(Rails::Server)
        PeleasPeriodicasJob.set(wait: config.intervalo_peleas.minutes).perform_later
      end
    end
  end
end
