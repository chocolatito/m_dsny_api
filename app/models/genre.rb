class Genre < ApplicationRecord
  include UrlConcern

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  # relations
  has_many :movies
end
