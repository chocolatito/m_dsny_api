# :url_picture, :name, :age, :weight, :history

class Character < ApplicationRecord
  include UrlConcern
  validates :name, presence: true
  validates :age, presence: true, numericality: { greater_than: 0 }
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :history, presence: true
  # relations
  has_many :casts
  has_many :movies, through: :casts, foreign_key: :movie_id

  scope :by_name, ->(name) { where('name LIKE ?', '%' + name + '%') }
  scope :by_age, ->(age) { where('age' => age) }
  # ->(movies:)    {joins(:movies).where({"cast_in_movies.movie_id" => movies})},
  scope :by_movies, ->(movies) { joins(:movies).where({ 'casts.movie_id' => movies }) }
  # scope :by_movies, ->(movie) { joins(:cast).where({ 'character_id' => movie }) }
end
