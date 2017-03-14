require 'rails_helper'

RSpec.feature "Rides", type: :feature do
  before do
    log_in
  end

  it 'displays new ride form' do
    visit new_ride_path

    expect(page).to have_content 'New Ride'
    expect(page).to have_button 'Add Ride'
  end
end
