class Area < ApplicationRecord
  FORM = 10

  belongs_to :travel, inverse_of: :areas

  validates_presence_of :travel
  validates :country, presence: true, length: { in: 1..20 }
  validates :place, presence: true, length: { in: 1..20 }
end
