class Area < ApplicationRecord
  belongs_to :travel, inverse_of: :areas

  validates :country, presence: true, length: { in: 1..20 }
  validates :place, presence: true, length: { in: 1..20 }
  validates_presence_of :travel
end
