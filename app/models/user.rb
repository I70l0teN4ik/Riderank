class User < ApplicationRecord
  has_secure_password
  has_many :rides

  validates :email, uniqueness: true, presence: true
  validates :username, presence: true
end
