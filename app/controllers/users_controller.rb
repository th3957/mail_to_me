class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:landing]

  def personal
    @user = User.find(current_user.id)
  end

  def landing
    redirect_to travels_path if user_signed_in?
  end
end
