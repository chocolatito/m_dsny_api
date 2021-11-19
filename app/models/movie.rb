class Movie < ApplicationRecord
  include UrlConcern
  validates :movie_or_serie,
            presence: true,
            inclusion: {
              in: %w[MOVIE SERIE],
              message: "'%{value}' is an invalid value. Only 'MOVIE' or 'SERIE' is allowed"
            }
  validates :title, presence: true, uniqueness: true
  validates :debut_date, presence: true
  validates :score, presence: true,
                    numericality: { greater_than: 0, less_than: 6 }
  # relations
  belongs_to :genre
  has_many :casts
  has_many :characters, through: :casts, foreign_key: :character_id

  scope :by_title, ->(title) { where('title LIKE ?', '%' + title + '%') }
  scope :by_genre, ->(genre) { joins(:genre).where({ 'genre.id' => genre }) }
  scope :ordered_by_title, ->(order) { order('title' => order) }
end
