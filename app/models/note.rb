class Note < ApplicationRecord
  mount_uploader :image, ImagesUploader

  belongs_to :travel

  validates :content, presence: true, length: { in: 1..255 }
  validates :image, image: true, file_size: { less_than: 10.megabytes }
  validates :importance, inclusion: { in: [true, false] }
  validates :travel, presence: true
end
