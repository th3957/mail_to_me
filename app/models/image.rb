class Image < ApplicationRecord
  mount_uploader :data, ImagesUploader

  FORM = 2

  belongs_to :card, inverse_of: :images

  validates :data, presence: true, image: true, file_size: { less_than: 10.megabytes }
  validates :card, presence: true
end
