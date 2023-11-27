class Response < ApplicationRecord
  belongs_to :question
  belongs_to :sub_user, through: :question
end
