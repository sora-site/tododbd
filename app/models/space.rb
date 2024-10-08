class Space < ApplicationRecord
  has_many :space_users, dependent: :destroy
  belongs_to :project
  has_many :users, through: :space_users
  has_many :messages

  with_options presence: true do
    validates :space_name
  end
  validate :user_ids_must_be_at_least_two

  private

  def user_ids_must_be_at_least_two
    return unless user_ids.length < 2

    errors.add(:user_ids, 'を１人以上選択してください')
  end
end
