# attributes :id, :movie_or_serie, :url_picture, :title, :debut_date, :score

class MovieSerializer < ActiveModel::Serializer
  attributes :id, :url_picture, :title, :debut_date
end
