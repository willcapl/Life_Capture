class SubUser < ApplicationRecord
  has_many :questions
  has_many :responses, through: :questions
  belongs_to :user
  has_many :questions
end
