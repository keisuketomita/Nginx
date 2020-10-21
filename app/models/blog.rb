class Blog < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
  belongs_to :user
  mount_uploader :image, ImageUploader
end
