class Space < ApplicationRecord
  has_many :space_users
  has_many :users, through: :space_users
end
