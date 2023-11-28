class Playlist < ApplicationRecord
  has_many :response_bookmarks
  validates :name, { presence: true, uniqueness: true }
end
