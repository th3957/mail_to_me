class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]

  def show
    @user = User.find(current_user.id)
  end

  def top
    redirect_to travels_path if user_signed_in?
  end
end
