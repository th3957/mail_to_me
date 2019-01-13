class Card < ApplicationRecord
  belongs_to :travel
  has_many :images, inverse_of: :card, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :all_blank
end
