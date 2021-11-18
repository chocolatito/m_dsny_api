# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'date'

# ______________________________________________________________________________
'@#$%&'.split('').each do |g|
  Genre.create(name: "Genre_#{g * 3}", url_picture: "picture.net/Genre_pic_#{g * 3}")
end

# ______________________________________________________________________________
'ABCDEFGHI'.split('').each do |c|
  Character.create(url_picture: "picture.net/characters/#{c * 5}",
                   name: (c * 5).to_s,
                   age: rand(9..500), weight: rand(45.0..130.0).floor(2),
                   history: "#{c * rand(1..40)} #{c * rand(1..40)} #{c * rand(1..40)} #{c * rand(1..40)} #{c * rand(1..40)} #{c * rand(1..40)}")
end

# ______________________________________________________________________________
# Date.today - rand(33556)
# Returns a date between 01-01-1930 and today

genres = Genre.all
'ZYXW'.split('').each do |m|
  Movie.create(movie_or_serie: %w[MOVIE SERIE].sample,
               url_picture: "picture.net/movie/#{m * 3}",
               title: (m * 3).to_s,
               debut_date: Date.today - rand(33_556),
               score: rand(1..5),
               genre_id: genres.sample.id)
end
#______________________________________________________________________________
# numero de actores
n_ch = Character.all.count
# Array de ids de todos las peliculas
movie_ids = Movie.all.pluck(:id)
#
movie_ids.each do |m_id|
  # Array de ids de uno o todos los actores
  character_ids = Character.all.pluck(:id).shuffle[0, rand(1..n_ch)]
  character_ids.each { |ch_id| Cast.create(movie_id: m_id, character_id: ch_id) }
end
# ______________________________________________________________________________

# rake db:seed
# # delete_all
# Cast.delete_all
# Movie.delete_all
# Character.delete_all
# Genre.delete_all
# User.delete_all