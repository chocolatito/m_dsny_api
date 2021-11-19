require 'rails_helper'

RSpec.describe Genre, type: :model do
  it 'is valid with valid attributes' do
    expect(Genre.new(name: 'test_now', url_picture: 'test.io/test_now')).to be_valid
  end
end
