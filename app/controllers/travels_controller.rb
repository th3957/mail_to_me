class TravelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_travel, only: [:edit, :show, :update, :destroy]

  def index
    @travels = Travel.where(user_id: current_user.id)
  end

  def new
    @travel = Travel.new
    @travel.areas.build
  end

  def create
    @travel = current_user.travels.build(travel_params)
    if @travel.save
      redirect_to travels_path, notice: 'Successfully created.'
    else
      render :new
    end
  end

  def show
    keep_travel_id
  end

  def edit
    @travel.areas.build if @travel.areas.blank?
  end

  def update
    if @travel.update(travel_params)
      redirect_to travel_path(@travel), notice: 'Successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @travel.destroy
    redirect_to travels_path, notice: 'Successfully deleted.'
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
  end

  def keep_travel_id
    session[:travel_id] = @travel.id
  end

  def travel_params
    params.require(:travel).permit(:title,
                                   :departured_at,
                                   :returend_at,
                                   :travel_image,
                                   :user_id,
                                   areas_attributes:[:id, :country, :place, :_destroy]
                                   )
  end
end
