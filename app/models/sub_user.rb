class SubUser < ApplicationRecord
  has_many :questions
  has_many :responses, through: :questions
  belongs_to :user
  has_many :questions
  validates :name, :relationship_to_user, :dob, :childhood_location,
    :post_education, :birthplace, :career, :adult_life_location,
    :hobbies, :life_after_retirement, presence: true

end
