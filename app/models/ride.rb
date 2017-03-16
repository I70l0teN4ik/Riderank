class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :taxi

  validates :origin, :destination, :price, :distance, presence: true

  validates :price, :distance, numericality: { greater_than: 0 }

  before_validation :calc_distance

  scope :current_week, -> { where('rides.created_at > ? ', DateTime.current.beginning_of_week ) }
  scope :current_week_stats, -> { current_week.pluck('round(sum(distance) * 0.001, 1)','sum(price)').first }

  scope :current_month, -> { where('rides.created_at > ? ', DateTime.current.beginning_of_month) }

  scope :current_month_stats, -> {
    current_month.group("strftime('%Y-%m-%d 00:00:00 UTC', rides.created_at)").joins(:taxi).order(created_at: :desc)
      .pluck("strftime('%Y-%m-%d', rides.created_at)", 'round(sum(rides.distance) * 0.001, 1)',
             'round(avg(rides.distance) * 0.001, 1)','avg(rides.price)', "GROUP_CONCAT(DISTINCT taxis.name)")
  }

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
