class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cars = Car.limit(6)
  end
end
