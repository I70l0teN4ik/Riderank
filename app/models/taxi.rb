class Taxi < ApplicationRecord
  has_many :rides

  validates :name, presence: true, uniqueness: true
end
