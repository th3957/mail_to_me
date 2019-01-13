class Image < ApplicationRecord
  mount_uploader :data, ImagesUploader

  belongs_to :card, inverse_of: :images
end
