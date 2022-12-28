class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@astephan.digital"
  layout 'mailer'

  def base_url
    base_url = "#{Rails.application.config.action_mailer.default_url_options[:protocol]}://#{Rails.application.config.action_mailer.default_url_options[:host]}/"
  end
end
