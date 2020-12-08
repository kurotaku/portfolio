class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  include Uniqueable

  mount_uploader :image, ImageUploader

  has_many :posts

  def full_name
    last_name.to_s + ' ' + first_name.to_s
  end
end
