require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject { Genre.new(name: 'test_now', url_picture: 'test.io/test_now') }
  before { subject.save }
  it 'is valid with valid attributes' do
    expect(
      Movie.create(movie_or_serie: %w[MOVIE SERIE].sample,
                   url_picture: 'picture.net/movie/example',
                   title: 'example',
                   debut_date: Date.today - rand(33_556),
                   score: rand(1..5),
                   genre_id: subject.id)
    ).to be_valid
  end  
end
