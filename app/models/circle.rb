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
end
