class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :image, presence: true
  validates :box, presence: true
  validates :money, presence: true  

  belongs_to :user

  mount_uploader :image, ImageUploader
end
