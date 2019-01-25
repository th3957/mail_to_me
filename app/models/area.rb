class Area < ApplicationRecord
  belongs_to :travel, inverse_of: :areas

  validates :country, presence: true, length: { in: 1..30 }
  validates :place, presence: true, length: { in: 1..30 }
  validates_presence_of :travel
end
