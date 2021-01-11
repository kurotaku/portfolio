class DefaultMailer < ApplicationMailer
  default from: Rails.application.credentials.common[:from_email]

  def send_mail(user, subject, content, url)
    @user = user
    email_with_name = %("#{@user.last_name} #{@user.first_name}" <#{@user.email}>)
    @content = content
    @url     = url

    mail(
      to: email_with_name,
      subject: subject, &:html
    )
  end
end
