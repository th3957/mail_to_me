class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card, :identify_owner,
    only: [:edit, :show, :download, :update, :destroy]
  before_action :set_associated_travel, only: [:new, :edit, :create, :destroy]

  def new
    @card = Card.new
    Image::FORM.times { @card.images.build }
  end

  def create
    @card = @associated_travel.cards.build(card_params)
    if @card.save
      redirect_to card_path(@card), notice: 'Successfully created.'
    else
      render :new
    end
  end

  def show
    respond_to do |f|
      f.html do
        keep_own_travel_id
        set_associated_travel
      end

      f.pdf do
        card_pdf = CardPdf.new(@card)
        send_data card_pdf.render,
                  filename: "#{@card.title}#{I18n.l(Time.current, format: :download)}.pdf",
                  type: 'application/pdf',
                  disposition: 'inline'
      end
    end
  end

  def download
    send_data CardPdf.new(@card).render,
              filename: "#{@card.title}#{I18n.l(Time.current, format: :download)}.pdf",
              type: 'application/pdf'
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to card_path(@card), notice: 'Successfully updated.'
    else
      set_associated_travel
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to travel_path(@associated_travel), notice: 'Successfully deleted.'
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def identify_owner
    if @card.travel.user_id != current_user.id
      render file: Rails.root.join('public/404.html'),
             status: 404,
             layout: false,
             content_type: 'text/html'
    end
  end

  def keep_own_travel_id
    session[:travel_id] = @card.travel_id
  end

  def card_params
    params.require(:card).permit(:title,
                                 :sentence,
                                 :frame_style,
                                 :font_style,
                                 :travel_id,
                                 images_attributes:[:id, :data, :data_cache, :_destroy]
                                 )
  end
end
