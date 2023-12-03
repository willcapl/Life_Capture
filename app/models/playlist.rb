class Playlist < ApplicationRecord
  has_many questions: :response_bookmarks, dependent: :destroy
  validates :name, { presence: true, uniqueness: true }
end
