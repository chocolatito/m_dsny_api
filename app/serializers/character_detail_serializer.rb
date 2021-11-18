class CharacterDetailSerializer < ActiveModel::Serializer
  has_many :movies, serializer: MovieSerializer
  attributes :id, :url_picture, :name, :age, :weight, :history
  
  #has_many :movies, through: :casts, foreign_key: :movie_id

end
