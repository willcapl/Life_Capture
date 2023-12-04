class Question < ApplicationRecord
  belongs_to :sub_user
  has_one :response
  validates :title, presence: true
  has_one_attached :video
  has_many :response_bookmarks, dependent: :destroy
end
