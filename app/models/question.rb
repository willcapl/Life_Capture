class Question < ApplicationRecord
  belongs_to :sub_user
  has_one :response
  validates :title, presence: true
end
