class Dashboard::ProfilesController < ApplicationController


  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_dashboard_profile_path
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :address, :user_type)
  end


end
