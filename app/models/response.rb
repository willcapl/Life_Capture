class Response < ApplicationRecord
  belongs_to :question
  has_many :response_bookmarks
end
