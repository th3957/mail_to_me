class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:edit, :show, :update, :destroy]
  before_action :set_associated_travel, only: [:index, :create]

  def index
    @lists = @associated_travel.lists
    @list = List.new
    @list.items.build
  end

  def personal
    @lists = List.where(travel_id: current_user.travels.ids)
  end

  def create
    @list = @associated_travel.lists.build(list_params)
    respond_to do |f|
      if @list.save
        f.js { render partial: 'lists/index_js' }
      else
        f.js { render partial: 'lists/new_js' }
      end
    end
  end

  def show
    keep_own_travel_id
    set_associated_travel
  end

  def edit
    @list.items.build if @list.items.blank?
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list), notice: 'Successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice: 'Successfully deleted.'
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def keep_own_travel_id
    session[:travel_id] = @list.travel_id
  end

  def list_params
    params.require(:list).permit(:title,
                                 items_attributes:[:id, :name, :remark, :_destroy]
                                 )
  end
end
