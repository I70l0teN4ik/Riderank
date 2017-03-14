require 'rails_helper'

RSpec.describe DrivingDistanceCalculator do
  context 'invalid ride' do
    subject { DrivingDistanceCalculator.new(Ride.create) }

    it 'gets bad response from google maps api' do
      expect(subject.is_successful?).to be_falsey
    end
  end

  context 'valid origin and destination' do
    subject { DrivingDistanceCalculator.new(
        Ride.create(origin: 'Mazowiecka 3/5, Warszawa', destination: 'plac Europejski 2, Warszawa')) }

    it 'gets successful response from google maps api' do
      expect(subject.is_successful?).to be_truthy
    end

    it 'calculates driving distance correctly' do
      expect(subject.ride_distance).to eq 2828
    end

    it 'calculates driving distance in km correctly' do
      expect(subject.ride_distance_km).to eq '2.8 km'
    end
  end


end
