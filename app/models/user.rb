class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :spaces
  has_many :spaces, through: :space_users
  has_many :space_users
  has_many :messages

  VALID_PASSWORD_REGEX = /\A(?=.*[a-z]\d)[a-z\d]{6,128}\z/

  validates :password, format: { with: VALID_PASSWORD_REGEX }, on: :create
  validates :birthday, presence: true
  validates :nickname, presence: true
end
