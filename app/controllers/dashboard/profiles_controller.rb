class Dashboard::ProfilesController < ApplicationController

  before_action :find_user

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to dashboard_profile_path
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :address, :user_type, :photo)
  end

  def find_user
    @user = current_user
  end


end
