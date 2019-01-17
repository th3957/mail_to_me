class Note < ApplicationRecord
  mount_uploader :image, ImagesUploader

  belongs_to :travel

  validates :content, presence: true, length: { in: 1..255 }
  validates :image, image: true
  validates :importance, inclusion: { in: [true, false] }
  validates_presence_of :travel
end
