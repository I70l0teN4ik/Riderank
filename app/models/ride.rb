class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :taxi

  validates :origin, :destination, :price, :distance, presence: true

  validates :price, :distance, numericality: { greater_than: 0 }

  before_validation :calc_distance

  private

  def calc_distance
    unless self.distance > 0
      d = DrivingDistanceCalculator.new(self).ride_distance
      if d
        self.distance = d
      end
    end
  end
end
