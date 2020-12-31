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
class BoardSerializer < ActiveModel::Serializer
  attributes :id
end
