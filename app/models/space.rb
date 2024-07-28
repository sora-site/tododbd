class Space < ApplicationRecord
  has_many :space_users
  has_many :users, through: :space_users

  with_options presence: true do
    validates :space_name
  end
end
