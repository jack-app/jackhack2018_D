class Tag < ApplicationRecord
  has_many :users_tags, dependent: :destroy
  has_many :users, through: :users_tags
end
