class CastSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :movie
  belongs_to :character
end
