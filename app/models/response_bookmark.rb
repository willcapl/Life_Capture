class ResponseBookmark < ApplicationRecord
  belongs_to :response
  belongs_to :playlist
end
