class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  # has_many :messages
  # has_many :room_users
  # has_many :rooms, through: :room_users
  has_many :space_users
  has_many :spaces, through: :space_users

  VALID_PASSWORD_REGEX = /\A(?=.*[a-z]\d)[a-z\d]{6,128}\z/

  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :birthday, presence: true
  validates :nickname, presence: true
end
