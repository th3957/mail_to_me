class List < ApplicationRecord
  belongs_to :travel
  has_many :items, inverse_of: :list, dependent: :destroy
  accepts_nested_attributes_for :items,
                                allow_destroy: true,
                                reject_if: :all_blank,
                                limit: 100

  validates :title, presence: true, length: { in: 1..20 }
  validates :travel, presence: true
end
