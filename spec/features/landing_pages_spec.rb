require 'rails_helper'

RSpec.feature 'Landing Pages', type: :feature do
  before do
    visit root_path
  end

  it 'displays Riderank title' do
    expect(page).to have_content 'Riderank'
  end

  it 'displays Login and SignUp buttons' do
    expect(page).to have_link 'Log in'
    expect(page).to have_link 'Sign up'
  end

  it 'displays Sign up form when click on button' do
    click_on 'Sign up'
    expect(page).to have_button 'Sign up'
  end

  it 'displays Log in form when click on button' do
    click_on 'Log in'
    expect(page).to have_button 'Log in'
  end

  context 'User logged in' do
    before do
      user = User.new(id: 0, username: 'foo', email: 'foo@bar.com', password: 'bar')
      user.save

      visit login_path
      fill_in 'session[email]', with: 'foo@bar.com'
      fill_in 'session[password]', with: 'bar'
      click_button 'Log in'
    end

    it 'displays welcome message' do
      visit root_path

      expect(page).to have_content 'Welcome to Riderank!'
      expect(page).to have_link 'Log out'
    end

    it 'displays add ride and view stats buttons' do

      expect(page).to have_link 'Add ride'
      expect(page).to have_link 'View stats'
    end

    after do
      user = User.find_by_email('foo@bar.com')
      user.delete if user
    end
  end
end
