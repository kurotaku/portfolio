class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.common[:from_email]
  layout 'mailer'
end
