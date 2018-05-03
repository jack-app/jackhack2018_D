class User < ApplicationRecord
  before_save {self.email.downcase!}
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
            length: {minimum: 6}
  has_secure_password
end
