# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  status     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :board do
    status { 1 }
  end
end
