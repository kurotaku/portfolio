# == Schema Information
#
# Table name: chats
#
#  id          :bigint           not null, primary key
#  content     :string(255)
#  uuid        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  chatroom_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_chats_on_chatroom_id  (chatroom_id)
#  index_chats_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (chatroom_id => chatrooms.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :chat do
    user { nil }
    chatroom { nil }
    content { "MyString" }
    uuid { "MyString" }
  end
end
