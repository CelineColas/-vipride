class ProfilesController < ApplicationController

  before_action :find_profile

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to edit_dashboard_profile_path(@profile)
    else
      render :edit
    end
  end


  private

  def profile_params
    params.require(:profile).permit(:name, :address, :user_type)
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end


end
