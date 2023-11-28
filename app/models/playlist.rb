class Playlist < ApplicationRecord
  has_many :response_bookmarks, dependent: :destroy
  validates :name, { presence: true, uniqueness: true }
end
