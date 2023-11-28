class SubUser < ApplicationRecord
  has_many :responses, through: :questions, dependent: :destroy
  belongs_to :user
  has_many :questions, dependent: :destroy
  validates :name, :relationship_to_user, :dob, :childhood_location,
    :post_education, :birthplace, :career, :adult_life_location,
    :hobbies, :life_after_retirement, presence: true

end
