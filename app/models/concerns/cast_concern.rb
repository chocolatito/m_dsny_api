# Solo para el modelo Cast
# Valida que no se repitan convinaciones de movie_id y character_id
#
module CastConcern
  extend ActiveSupport::Concern
  included do
    validates :movie, uniqueness: { scope: :character }
  end
end
