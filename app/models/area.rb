class Area < ApplicationRecord
  belongs_to :travel, inverse_of: :areas

  validates :country, presence: true, length: { in: 1..30 }
  validates :place, presence: true, length: { in: 1..30 }
  validates :arrived_at, presence: true
  validates :left_at, presence: true
  validates :travel, presence: true
  validate :leave_before_arrived_date?

  def leave_before_arrived_date?
    if left_at < arrived_at
      errors[:date_check] << I18n.t('errors.area.date_check')
    end
  end
end
