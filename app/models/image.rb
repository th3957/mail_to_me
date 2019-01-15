class Image < ApplicationRecord
  mount_uploader :data, ImagesUploader

  FORM = 10

  belongs_to :card, inverse_of: :images

  validates_presence_of :card
end
