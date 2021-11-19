# Only for Cast model
# Validate that convinations of movie_id and character_id are not repeated
module CastConcern
  extend ActiveSupport::Concern
  included do
    validates :movie, uniqueness: { scope: :character }
  end
end
