class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :username, presence: true
end
