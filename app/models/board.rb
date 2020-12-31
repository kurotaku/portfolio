# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  status     :integer          default(0), not null
#  uuid       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  has_many :board_users
  has_many :users, through: :board_users
  has_many :messages
end
