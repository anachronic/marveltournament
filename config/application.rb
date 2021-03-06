# coding: utf-8
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

    # Con sidekiq y sidekiq-cron haremos las peleas y resets de
    # ranking
    config.active_job.queue_adapter = :sidekiq
    redis_url = 'redis://localhost:6379/0'

    # No usar localhost en producción
    redis_url = ENV['REDIS_URL'] if Rails.env.production?
    config.redis_url = redis_url
  end
end
