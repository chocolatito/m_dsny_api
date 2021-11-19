require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    expect(User.new(email: 'user_a@example.com', password: 'password_a')).to be_valid
  end
  it 'is not valid without an email' do
    expect(User.new(email: nil, password: 'password_a')).to_not be_valid
  end
  it 'is not valid without a malformed email' do
    expect(User.new(email: '@name.addres.net', password: 'password_a')).to_not be_valid
    expect(User.new(email: 'name.addres.net@', password: 'password_a')).to_not be_valid
  end
  it 'is not valid without a password' do
    expect(User.new(email: 'user_a@example.com', password: nil)).to_not be_valid
  end
  it 'is not valid without a short password' do
    expect(User.new(email: 'user_a@example.com', password: 'passw')).to_not be_valid
    expect(User.new(email: 'user_a@example.com', password: 'pass')).to_not be_valid
    expect(User.new(email: 'user_a@example.com', password: 'pas')).to_not be_valid
    expect(User.new(email: 'user_a@example.com', password: 'pa')).to_not be_valid
    expect(User.new(email: 'user_a@example.com', password: 'p')).to_not be_valid
  end
end
# rails generate rspec:model movie
