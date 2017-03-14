require 'rails_helper'

RSpec.describe Ride, type: :model do
  it 'validates new Ride' do
    ride = Ride.new
    expect(ride.valid?).to be_falsey
  end

  it 'appends distance for new ride' do
    ride = Ride.new(origin: 'Mazowiecka 3/5, Warszawa', destination: 'plac Europejski 2, Warszawa')
    ride.validate

    expect(ride.distance).to be > 0
  end
end
