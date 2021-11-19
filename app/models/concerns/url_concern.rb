# For the <:url_picture> field in
# Genre, Movie and Character

module UrlConcern
  extend ActiveSupport::Concern
  included do
    # minimum e.g.: 'g.cn' is url of google
    validates :url_picture, presence: true, length: { minimum: 4 }, uniqueness: true
  end
end
