class Travel < ApplicationRecord
  mount_uploader :travel_image, ImagesUploader

  belongs_to :user
  has_many :cards, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :areas, inverse_of: :travel, dependent: :destroy
  accepts_nested_attributes_for :areas, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true, length: { in: 1..20 }
  validates :departured_at, presence: true
  validates :returend_at, presence: true
  validate :return_before_departure_date

  def return_before_departure_date
    if returend_at < departured_at
      errors.add(:returend_at, ": Can't set return date before departure date.")
    end
  end
end
