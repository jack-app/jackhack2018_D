class Circle < ApplicationRecord
  validates :name,
            presence: true,
            length: {minimum: 2}
  validates :profile,
            presence: true
  validates :cost,
            presence: true
  has_many :users_circles, dependent: :destroy
  has_many :users, through: :users_circles
  has_many :circles_tags,dependent: :destroy
  has_many :tags, through: :circles_tags
end
