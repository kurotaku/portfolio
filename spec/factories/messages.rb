# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  content    :string(255)
#  uuid       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_messages_on_board_id  (board_id)
#  index_messages_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :message do
    user { nil }
    board { nil }
    content { 'MyString' }
  end
end
