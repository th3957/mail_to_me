class Travel < ApplicationRecord
  mount_uploader :travel_image, ImagesUploader

  belongs_to :user
  has_many :lists, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :areas, inverse_of: :travel, dependent: :destroy
  accepts_nested_attributes_for :areas,
                                allow_destroy: true,
                                reject_if: :all_blank,
                                limit: 10

  validates :title, presence: true, length: { in: 1..20 }
  validates :departed_at, presence: true
  validates :returned_at, presence: true
  validates :travel_image, image: true, file_size: { less_than: 10.megabytes }
  validates :user, presence: true
  validate :return_before_departed_date?

  def return_before_departed_date?
    if returned_at < departed_at
      errors[:base] << I18n.t('errors.travel.date_check')
    end
  end
end
