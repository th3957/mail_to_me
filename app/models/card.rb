class Card < ApplicationRecord
  belongs_to :travel
  has_many :images, inverse_of: :card, dependent: :destroy
  accepts_nested_attributes_for :images,
                                allow_destroy: true,
                                limit: 2

  enum frame_style: { basic:  0,
                      tile:   1,
                     }

  enum font_style: { ipaex_gothic:     0,
                     yasashisa_gothic: 1,
                     playball:         2,
                    }

  validates :title, presence: true, length: { in: 1..20 }
  validates :sentence, presence: true, length: { in: 1..255 }
  validates :frame_style, presence: true, inclusion: { in: Card.frame_styles.keys }
  validates :font_style, presence: true, inclusion: { in: Card.font_styles.keys }
  validates_presence_of :travel
end
