class Area < ApplicationRecord
  belongs_to :travel, inverse_of: :areas

  validates :country, presence: true, length: { in: 1..30 }
  validates :place, presence: true, length: { in: 1..30 }
  validates :arrived_at, presence: true
  validates :left_at, presence: true
  validate :leave_before_arrived_date?
  validates_presence_of :travel

  def leave_before_arrived_date?
    if left_at < arrived_at
      errors.add(:left_at, ": Can't set leave date before arrived date.")
    end
  end
end
