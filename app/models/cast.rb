class Cast < ApplicationRecord
  # relations
  belongs_to :movie
  belongs_to :character
end
