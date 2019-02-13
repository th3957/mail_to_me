class CardPdf < Prawn::Document
  def initialize(card)
    @card = card
    if @card.frame_style == 'basic'
      super(page_size: [500, 740], page_layout: :landscape)
    end
    stroke_axis
  end
end
