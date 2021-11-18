# Para los modelos que definen el campo :url_picture
# Genre
# Character
# Movie
#

module UrlConcern
  extend ActiveSupport::Concern
  included do
    # minimum e.g.: 'g.cn' is url of google
    validates :url_picture, presence: true, length: { minimum: 4 }, uniqueness: true
  end
end
