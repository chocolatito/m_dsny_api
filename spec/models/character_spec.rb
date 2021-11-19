require 'rails_helper'

RSpec.describe Character, type: :model do
  it 'is valid with valid attributes' do
    expect(
      Character.create(url_picture: 'picture.net/characters/test',
                       name: 'test',
                       age: rand(9..500), weight: rand(45.0..130.0).floor(2),
                       history: 'testtesttesttest testtest test testtesttesttest testtest testtesttesttest')
    ).to be_valid
  end
end
