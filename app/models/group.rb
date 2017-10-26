class Group < ApplicationRecord
  validates :name, :user_ids, presence: true
  has_many :groups_users
  has_many :users, through: :groups_users
  has_many :messages
end
