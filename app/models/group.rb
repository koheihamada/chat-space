class Group < ApplicationRecord
  validates :name, :user_ids, presence: true
  has_many :groups_users
  has_many :users, through: :groups_users
  has_many :messages


def nanana

    if messages.last.try(:image).blank? && messages.last.try(:body).blank?
      'なにもありましせん'
    elsif messages.last.try(:image).blank?
      messages.last.try(:body)
    else
      '写真があります'
      end
  end

end
