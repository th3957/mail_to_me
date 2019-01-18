class Item < ApplicationRecord
  FORM = 10

  belongs_to :list, inverse_of: :items

  validates_presence_of :list
end
