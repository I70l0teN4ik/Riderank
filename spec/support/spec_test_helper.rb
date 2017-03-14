module SpecTestHelper

  def log_in
    user = User.new(id: 0, username: 'foo', email: 'foo@bar.com', password: 'bar')
    user.save

    visit login_path
    fill_in 'session[email]', with: 'foo@bar.com'
    fill_in 'session[password]', with: 'bar'
    click_button 'Log in'
  end
end