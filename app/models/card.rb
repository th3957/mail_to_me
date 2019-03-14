class Card < ApplicationRecord
  belongs_to :travel
  has_many :images, inverse_of: :card, dependent: :destroy
  accepts_nested_attributes_for :images,
                                allow_destroy: true,
                                reject_if: :all_blank,
                                limit: 2

  enum frame_style: { basic:    0,
                      overlay:  1,
                      overlay2: 2
                     }

  enum font_style: { ipaex_gothic:     0,
                     yasashisa_gothic: 1,
                     koku_gothic:      2,
                     shippori_mincho:  3,
                     soukou_mincho:    4,
                     playball:         5
                    }

  validates :title, presence: true, length: { in: 1..20 }
  validates :sentence, presence: true, length: { in: 1..255 }
  validates :frame_style, presence: true, inclusion: { in: Card.frame_styles.keys }
  validates :font_style, presence: true, inclusion: { in: Card.font_styles.keys }
  validates :travel, presence: true
  validate :has_two_images?

  def has_two_images?
    if self.images.length <= 1
      errors[:base] << I18n.t('errors.card.more_image')
    end
  end
end
