class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card, only: [:edit, :show, :update, :destroy]
  before_action :set_associated_travel, only: [:create, :destroy]

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
    keep_own_travel_id
    set_associated_travel
  end

  def edit
    (Image::FORM - @card.images.count).times { @card.images.build }
  end

  def update
    if @card.update(card_params)
      redirect_to card_path(@card), notice: 'Successfully updated.'
    else
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

  def keep_own_travel_id
    session[:travel_id] = @card.travel_id
  end

  def card_params
    params.require(:card).permit(:title,
                                 :sentence,
                                 :frame_style,
                                 :font_style,
                                 :travel_id,
                                 images_attributes:[:id, :data]
                                 )
  end
end
