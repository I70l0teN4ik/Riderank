class DrivingDistanceCalculator
  require 'net/http'

  def initialize(ride)
    @ride = ride
    @body = direction_body
  end

  def ride_distance
    @body['routes'].first['legs'].first['distance']['value'] if is_successful?
  end

  def ride_distance_km
    @body['routes'].first['legs'].first['distance']['text'] if is_successful?
  end

  def is_successful?
    @body['status'] == 'OK'
  end


  private

  def direction_body
    uri = URI('https://maps.googleapis.com/maps/api/directions/json')
    uri.query = URI.encode_www_form(
        mode: 'driving',
        language: 'en',
        units: 'metric',
        origin: @ride.origin,
        destination: @ride.destination,
    )
    res = Net::HTTP.get_response(uri)

    JSON.parse(res.body)
  end
end