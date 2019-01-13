class Note < ApplicationRecord
  mount_uploader :image, ImagesUploader

  belongs_to :travel

  validates :content, presence: true, length: { in: 1..255 }
  validates :importance, inclusion: { in: [true, false] }
end
