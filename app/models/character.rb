class Character < ApplicationRecord
  include UrlConcern
  validates :name, presence: true
  validates :age, presence: true, numericality: { greater_than: 0 }
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :history, presence: true
  # relations
  has_many :casts
  has_many :movies, through: :casts, foreign_key: :movie_id
  # scopes
  scope :by_name, ->(name) { where('name LIKE ?', '%' + name + '%') }
  scope :by_age, ->(age) { where('age' => age) }
  scope :by_movies, ->(movies) { joins(:movies).where({ 'casts.movie_id' => movies }) }
end
