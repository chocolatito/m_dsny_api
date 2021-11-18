# :name, :url_picture

class Genre < ApplicationRecord
  include UrlConcern
  # url_picture
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  has_many :movies
end
