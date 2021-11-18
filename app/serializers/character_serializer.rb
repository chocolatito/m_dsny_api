# attributes :id, :url_picture, :name, :age, :weight, :history
class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :url_picture, :name
  
end
