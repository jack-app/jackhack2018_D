class User < ApplicationRecord
  validates :family_name,
            presence: true,
            length: {maximum: 25}
  validates :first_name,
            presence: true,
            length: {maximum: 25}
  validates :email,
            presence: true,
            length: {maximum: 255},
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i },
            uniqueness: {case_sensitive: false}

  has_secure_password
end
