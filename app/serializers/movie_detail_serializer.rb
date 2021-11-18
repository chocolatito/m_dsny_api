# attributes :id, :movie_or_serie, :url_picture, :title, :debut_date, :score

class MovieDetailSerializer < ActiveModel::Serializer
  belongs_to :genre
  has_many :characters
  attributes :id, :movie_or_serie, :url_picture, :title, :debut_date, :score
end
