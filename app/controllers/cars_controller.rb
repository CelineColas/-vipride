class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_car, only: [:show]

  def index
    if params[:brand]
      @cars = Car.where("brand ILIKE ?", "%#{params[:brand]}%")
    else
      @cars = Car.all
    end
    # cars GET    /cars(.:format)                           cars#index
  end

  def show
     # car GET    /cars/:id(.:format)                       cars#show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.save(car_params[:car])
    if @car.save
      @car = params[:brand][:model].titleize
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  private
  def find_car
    @car = Car.find(params[:id])
  end
end

