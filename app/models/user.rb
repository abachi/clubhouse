class User < ApplicationRecord
  before_create :create_remember_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true, length: { minimum: 4 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}
  validates :password, presence: true, length: { minimum: 4 }
  has_secure_password

  #relationships
  has_many :posts

  private
  def create_remember_token
    s = SecureRandom.urlsafe_base64
    self.remember_token = Digest::SHA1.hexdigest s
  end
end
