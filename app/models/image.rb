class Image < ApplicationRecord
  mount_uploader :data, ImagesUploader

  # まずは写真を２枚使用するレイアウトを実装
  FORM = 2

  belongs_to :card, inverse_of: :images

  validates :data, presence: true, image: true, file_size: { less_than: 5.megabytes }
  validates_presence_of :card
end
