class Post < ApplicationRecord
  belongs_to :user
  include Uniqueable
end
