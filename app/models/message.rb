class Message < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :body_or_image, presence: true
  belongs_to :user
  belongs_to :group



  private
  def body_or_image
    body.presence or image.presence
  end
end
