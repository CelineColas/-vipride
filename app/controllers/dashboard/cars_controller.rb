class Dashboard::CarsController < ApplicationController

def index
  @cars = current_user.cars
end

# def show
# end

def new
  @car = Car.new
end
def create
  @car = Car.new(car_params)
  @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
end

def edit # VIEW
end

def update
  @car.update(car_params)
  redirect_to car_path(@car)
end

private

  def car_params
    params.require(:car).permit(:brand, :model, :color, :description, :photo)
  end

end

       #     dashboard_cars GET    /dashboard/cars(.:format)                 dashboard/cars#index
       #                    POST   /dashboard/cars(.:format)                 dashboard/cars#create
       #  new_dashboard_car GET    /dashboard/cars/new(.:format)             dashboard/cars#new
       # edit_dashboard_car GET    /dashboard/cars/:id/edit(.:format)        dashboard/cars#edit
       #      dashboard_car PATCH  /dashboard/cars/:id(.:format)             dashboard/cars#update
       #                    PUT    /dashboard/cars/:id(.:format)             dashboard/cars#update
