module SpecTestHelper

  def log_in
    User.create(username: 'foo', email: 'foo@bar.com', password: 'bar')

    visit login_path
    fill_in 'session[email]', with: 'foo@bar.com'
    fill_in 'session[password]', with: 'bar'
    click_button 'Log in'
  end

  def seed
    user = User.last
    uber = Taxi.create(name: 'Uber')
    mpt = Taxi.create(name: 'MPT')

    now = DateTime.current

    Ride.create!([
        { user_id: user.id, taxi_id: uber.id, origin: '1', destination: '2', distance: 4455, price: 6.25, created_at: now },
        { user_id: user.id, taxi_id: mpt.id,  origin: '1', destination: '2', distance: 2828, price: 3.25, created_at: now.beginning_of_day + 1.hour },
        { user_id: user.id, taxi_id: uber.id, origin: '1', destination: '2', distance: 5000, price: 7.30, created_at: now.beginning_of_day + 1.day },
        { user_id: user.id, taxi_id: mpt.id, origin: '1', destination: '2', distance: 10000, price: 12.5, created_at: now.beginning_of_week - 1.day },
        { user_id: user.id, taxi_id: mpt.id, origin: '1', destination: '2', distance: 123456, price: 123.45, created_at: now.beginning_of_month - 1.week },
    ])
  end
end