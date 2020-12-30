# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  status     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  has_many :users, through: :bord_users
  has_many :messages
end
