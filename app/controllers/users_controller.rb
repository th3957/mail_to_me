class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:landing]

  def personal
    @user = User.find(current_user.id)
    @cards = Card.where(travel_id: @user.travels.ids).page(params[:page]).per(8).order('updated_at DESC')
  end

  def landing
    redirect_to travels_path if user_signed_in?
  end
end
