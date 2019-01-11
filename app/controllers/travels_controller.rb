class TravelsController < ApplicationController
  before_action :set_travel, only: [:edit, :show, :update, :destroy]

  def index
    @travels = Travel.all
  end

  def new
    @travel = Travel.new
    Area::FORM.times { @travel.areas.build }
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
  end

  def edit
    (Area::FORM - @travel.areas.count).times { @travel.areas.build }
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

  def travel_params
    params.require(:travel).permit(:title,
                                   :departured_at,
                                   :returend_at,
                                   :travel_image,
                                   :user_id,
                                   areas_attributes:[:id, :country, :place]
                                   )
  end
end
