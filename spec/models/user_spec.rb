require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates empty username' do
    user = User.new(email: 'test@test.com', password: 'bar')
    expect(user.valid?).to be_falsey
  end

  it 'validates empty email' do
    user = User.new(username: 'foo', password: 'bar')
    expect(user.valid?).to be_falsey
  end

  it 'validates empty password' do
    user = User.new(username: 'foo', email: 'test@test.com')
    expect(user.valid?).to be_falsey
  end

  it 'validates empty email uniqueness' do
    user1 = User.new(username: 'foo', email: 'test@test.com', password: 'bar')
    user1.save
    user2 = User.new(username: 'foo', email: 'test@test.com', password: 'bar')
    expect(user1.valid?).to be_truthy
    expect(user2.valid?).to be_falsey
    user1.delete
  end
end
