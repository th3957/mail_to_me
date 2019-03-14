class TravelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_travel, :identify_owner,
    only: [:edit, :show, :update, :destroy]

  def index
    @travels = Travel.where(user_id: current_user.id).
                      page(params[:page]).
                      per(8).order('updated_at DESC')
  end

  def new
    @travel = Travel.new
  end

  def create
    @travel = current_user.travels.build(travel_params)
    if @travel.save
      redirect_to travels_path,
        notice: I18n.t('views.message.success_create')
    else
      render :new
    end
  end

  def show
    @cards = @travel.cards.
                     page(params[:page]).
                     per(8).
                     order('updated_at DESC')
    keep_travel_id
  end

  def edit; end

  def update
    if @travel.update(travel_params)
      redirect_to travel_path(@travel),
        I18n.t('views.message.success_update')
    else
      render :edit
    end
  end

  def destroy
    @travel.destroy
    redirect_to travels_path,
      notice: I18n.t('views.message.success_delete')
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
  end

  def identify_owner
    if @travel.user_id != current_user.id
      render file: Rails.root.join('public/404.*.html'),
             status: 404,
             layout: false,
             content_type: 'text/html'
    end
  end

  def keep_travel_id
    session[:travel_id] = @travel.id
  end

  def travel_params
    params.require(:travel).
           permit(:title,
                  :departed_at,
                  :returned_at,
                  :travel_image,
                  :travel_image_cache,
                  :remove_travel_image,
                  :user_id,
                  areas_attributes:[:id,
                                    :country,
                                    :place,
                                    :arrived_at,
                                    :left_at,
                                    :_destroy])
  end
end
