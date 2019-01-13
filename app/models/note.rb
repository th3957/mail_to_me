class Note < ApplicationRecord
  mount_uploader :image, ImagesUploader

  belongs_to :travel
end
