class Item < ApplicationRecord
  belongs_to :list, inverse_of: :items

  validates :name, presence: true, length: { in: 1..20 }
  validates :remark, length: { maximum: 50 }
  validates :list, presence: true
end
