require 'rails_helper'

RSpec.feature "Rides", type: :feature do
  before do
    @user = log_in
  end

  it 'displays new ride form' do
    visit new_ride_path

    expect(page).to have_content 'New Ride'
    expect(page).to have_button 'Add Ride'
    expect(page).to have_link  'View stats'
  end

  context 'some rides do exist' do
    before do
      seed
      visit rides_path
    end

    it 'display current week stats' do
      expect(page).to have_content 'During current week you have rode 12.3 km and payed 16.80 €'
    end

    it 'display current month stats only' do
      expect(page).to have_content '7.3 km 3.6 km 4.75 € Uber,MPT'

      expect(page).not_to have_content '123.5 km 123.45 €'
    end

  end

end
