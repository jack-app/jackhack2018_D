class Tag < ApplicationRecord
  has_many :users_tags, dependent: :destroy
  has_many :users, through: :users_tags
  has_many :circles_tags, dependent: :destroy
  has_many :circles, through: :circles_tags
end
