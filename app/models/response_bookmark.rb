class ResponseBookmark < ApplicationRecord
  belongs_to :question
  belongs_to :playlist
end
