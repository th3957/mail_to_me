class List < ApplicationRecord
  belongs_to :user
  belongs_to :travel
  has_many :items, inverse_of: :list, dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :user
  validates_presence_of :travel
end
