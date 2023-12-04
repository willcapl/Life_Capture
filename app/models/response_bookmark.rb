class ResponseBookmark < ApplicationRecord
  belongs_to :question
  validates :question_id, uniqueness: true
  belongs_to :playlist
end
