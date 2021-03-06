class User < ApplicationRecord
  before_save {self.email.downcase!}
  validates :display_name,
            presence: true,
            length: {maximum: 25}
  validates :family_name,
            presence: true,
            length: {maximum: 25}
  validates :first_name,
            presence: true,
            length: {maximum: 25}
  validates :email,
            presence: true,
            length: {maximum: 255},
            format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},
            uniqueness: {case_sensitive: false}
  validates :password,
            presence: true,
            length: {minimum: 6},
            allow_nil: true
  validates :student_number,
            presence: true,
            format: {with: /\A(0[0-9]|10)1[0-8][0-9]{5}\z/i}
  validates :phone,
            format: {with: /\A(080|090)[0-9]{8}\z/i},
            allow_nil: true
  has_secure_password
  has_many :users_circles, dependent: :destroy
  has_many :circles, through: :users_circles
  has_many :users_tags, dependent: :destroy
  has_many :tags, through: :users_tags
end
