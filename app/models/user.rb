class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, { presence: true, uniqueness: true }
  validates :username, length: { minimum: 2 }
  has_many :sub_users
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sub_users
end
