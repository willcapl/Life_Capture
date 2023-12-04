class Playlist < ApplicationRecord
  validates :name, { presence: true, uniqueness: true }
  belongs_to :sub_user
  has_many :response_bookmarks
  has_many :questions, through: :response_bookmarks

  def get_response_bookmarks
    return self.response_bookmarks
  end

end
