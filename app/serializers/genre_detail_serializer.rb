# attributes :id, :name, :url_picture

class GenreDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :url_picture
  has_many :movies
end
