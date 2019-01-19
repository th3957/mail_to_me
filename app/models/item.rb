class Item < ApplicationRecord
  belongs_to :list, inverse_of: :items

  validates :name, presence: true, length: { in: 1..20 }
  validates :remark, length: { in: 1..50 }
  validates_presence_of :list
end
