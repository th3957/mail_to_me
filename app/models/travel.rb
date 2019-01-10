class Travel < ApplicationRecord
  mount_uploader :travel_image, ImagesUploader

  belongs_to :user
  has_many :areas, inverse_of: :travel
  accepts_nested_attributes_for :areas, allow_destroy: true
end
