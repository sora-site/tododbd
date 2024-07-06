class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  # has_many :messages
  # has_many :room_users
  # has_many :rooms, through: :room_users
  # has_many :space-users
  # has_many :spaces, through: :space-users
end
