class SendMailJob < ApplicationJob
  queue_as :send_mails

  def perform(title, content, user_ids, url = nil)
    users = User.where(id: user_ids.split(','))
    users.find_each do |user|
      DefaultMailer.send_mail(user, title, content, url).deliver_now
    end
  end
end
