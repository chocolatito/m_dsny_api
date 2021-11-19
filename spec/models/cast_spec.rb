require 'rails_helper'

RSpec.describe Cast, type: :model do
  it 'is valid with valid attributes' do
    genre = Genre.create(name: 'genero', url_picture: 'picture.net/characters/test_g')
    character = Character.create(url_picture: 'picture.net/characters/test_ch',
                                 name: 'test',
                                 age: rand(9..500), weight: rand(45.0..130.0).floor(2),
                                 history: 'testtesttesttest testtest test testtesttesttest testtest testtesttesttest')
    movie = Movie.create(movie_or_serie: %w[MOVIE SERIE].sample,
                         url_picture: 'picture.net/movie/test_m',
                         title: 'example',
                         debut_date: Date.today - rand(33_556),
                         score: rand(1..5),
                         genre_id: genre.id)
    expect(Cast.create(movie_id: movie.id, character_id: character.id)).to be_valid
  end
end
