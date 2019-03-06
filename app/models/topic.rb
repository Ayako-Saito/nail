class Topic < ApplicationRecord
  validates :user_id, presence: true
  # validates :contents, presence: true  考え中
  validates :image, presence: true

  belongs_to :user

  mount_uploader :image, ImageUploader
end
