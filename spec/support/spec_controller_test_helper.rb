module SpecControllerTestHelper

  def log_in
    user = User.create(id: 0, username: 'foo', email: 'foo@bar.com', password: 'bar')
    Taxi.create(id: 0, name: 'Uber')

    session[:user_id] = user.id
  end
end