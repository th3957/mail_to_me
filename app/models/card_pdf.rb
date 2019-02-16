class CardPdf < Prawn::Document
  def initialize(card)
    @card = card
    if @card.frame_style == 'basic'
      super(page_size: [485, 740], page_layout: :landscape)
      # 実際の描画領域は410*665

      bounding_box([4.11, 406.9], width: 402.8, height: 402.8){
        image "public/#{@card.images[0].data.url}", width: 402.8, height: 402.8
      }

      bounding_box([411, 406.9], width: 248.9, height: 153.9){
        image "public/#{@card.images[1].data.url}", width: 248.9, height: 153.9
      }

      bounding_box([411, 248.9], width: 248.9, height: 244.8){
        font("app/assets/fonts/#{@card.font_style}.ttf") do
          text "#{@card.sentence}", size: 22
        end
      }
    elsif @card.frame_style == 'overlay'
      super(page_size: [485, 740], page_layout: :landscape)

      bounding_box([0, 410], width: 665, height: 410){
        image "public/#{@card.images[0].data.url}", width: 665, height: 410
      }

      bounding_box([410, 390], width: 234, height: 390){
        font("app/assets/fonts/#{@card.font_style}.ttf") do
          text "#{@card.title}", size: 36
          text "#{@card.sentence}", size: 22
        end
      }
    else
      super(page_size: [485, 740], page_layout: :landscape)

      bounding_box([0, 410], width: 665, height: 410){
        image "public/#{@card.images[0].data.url}", width: 665, height: 410
      }

      bounding_box([410, 390], width: 234, height: 390){
        font("app/assets/fonts/#{@card.font_style}.ttf") do
          text "#{@card.title}", size: 36, color: 'ffffff'
          text "#{@card.sentence}", size: 22, color: 'ffffff'
        end
      }
    end
  end
end
