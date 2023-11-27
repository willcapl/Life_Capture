class Playlist < ApplicationRecord
  has_many :response_bookmarks
  validatas :name, { presence: true, uniqueness: true }
end
