class Card < ApplicationRecord
  belongs_to :travel
  has_many :images, inverse_of: :card, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :all_blank

  enum frame_style: { frame_sample0: 0, frame_sample1: 1, frame_sample2: 2 }
  enum font_style: { font_sample0: 0, font_sample1: 1, font_sample2: 2 }
end
