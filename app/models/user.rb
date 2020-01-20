class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true, length: { minimum: 4 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}
  validates :password, presence: true, length: { minimum: 4 }
  has_secure_password
end
