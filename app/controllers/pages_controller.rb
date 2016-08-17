class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:brand]
      @cars = Car.where("brand ILIKE ?", "%#{params[:brand]}%")
    else
      @cars = Car.all
    end
    @cars = Car.limit(6)
  end
end
