module SpecControllerTestHelper

  def log_in
    user = User.new(id: 0, username: 'foo', email: 'foo@bar.com', password: 'bar')
    user.save
    taxi = Taxi.new(id: 0, name: 'Uber')
    taxi.save

    session[:user_id] = user.id
  end

  def log_out
    user = User.find(0)
    user.delete if user
    taxi = Taxi.find(0)
    taxi.delete if taxi
    session[:user_id] = nil
  end
end