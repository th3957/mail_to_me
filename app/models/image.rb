class Image < ApplicationRecord
  mount_uploader :data, ImagesUploader

  FORM = 10

  belongs_to :card, inverse_of: :images

  validates :data, presence: true, image: true, file_size: { less_than: 5.megabytes }
  validates_presence_of :card
end
