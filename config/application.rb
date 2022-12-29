require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GenerateLorumIp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # config.i18n.default_locale = :fr
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Europe/Dublin"
    # config.eager_load_paths << Rails.root.join("extras")
    
    config.action_mailer.delivery_job = "ActionMailer::MailDeliveryJob"
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.default_url_options = {
      :host => 'as-web.website',
      :protocol => 'http'
    }
    config.action_mailer.smtp_settings = {
    :address => 'smtp.gmail.com',
    :port => 465,
    :user_name => 'alexis@astephan.digital',
    :password => ENV['MAILPASSWORD'],
    :authentication => 'plain',
    :enable_starttls_auto => true
    }
  end
end
