class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, :identify_owner,
    only: [:edit, :duplicate, :show, :update, :destroy]
  before_action :set_associated_travel, only: [:index, :create, :edit]

  def index
    @lists = @associated_travel.lists.
                                page(params[:page]).
                                per(15).
                                order('id DESC')

    @list = List.new
    @list.items.build
  end

  def personal
    @lists = List.where(travel_id: current_user.travels.ids).
                  page(params[:page]).
                  per(15).
                  order('id DESC')
  end

  def create
    respond_to do |f|
      f.js do
        @list = @associated_travel.lists.build(list_params)
        if @list.save
          render partial: 'lists/index_js'
        else
          render partial: 'lists/new_js'
        end
      end

      f.html do
        @list = @associated_travel.lists.build(duplicate_list_params)
        if @list.save
          redirect_to lists_path,
            notice: I18n.t('views.message.success_duplicate')
        else
          render :duplicate
        end
      end
    end
  end

  def show
    @travels = Travel.where(user_id: current_user.id)
    keep_own_travel_id
    set_associated_travel
  end

  def edit
    @list.items.build ||= @list.items
  end

  def duplicate
    session[:travel_id] = params[:travel_id]
    set_associated_travel
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list),
        notice: I18n.t('views.message.success_update')
    else
      render partial: 'lists/new_js'
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path,
      notice: I18n.t('views.message.success_delete')
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def identify_owner
    if @list.travel.user_id != current_user.id
      render file: Rails.root.join('public/404.html'),
             status: 404,
             layout: false,
             content_type: 'text/html'
    end
  end

  def keep_own_travel_id
    session[:travel_id] = @list.travel_id
  end

  def list_params
    params.require(:list).
           permit(:title, items_attributes:[:id, :name, :remark, :_destroy])
  end

  def duplicate_list_params
    params.require(:list).
           permit(:title, items_attributes:[:name, :remark, :_destroy])
  end
end
