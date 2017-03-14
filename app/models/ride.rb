class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :taxi

  validates :origin, :destination, :price, :distance, presence: true

  validates :price, :distance, numericality: { greater_than: 0 }

  before_validation :calc_distance

  private

  def calc_distance
    self.distance = 2828
  end
end
