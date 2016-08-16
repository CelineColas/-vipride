class Dashboard::BookingsController < ApplicationController
  before_action :set_booking, only: [:approve, :reject]

  def index
    @bookings = Booking.all
  end

  # def show
  #   @dose = Dose.new
  #   @ingredients = Ingredient.all
  # end

  # def new
  #   @booking = Booking.new
  # end

  # def create
  #   @booking = Booking.new(booking_params)
  #   @booking.save!
  #   redirect_to bookings_path
  # end

  # def edit
  # end

  # def update
  #   @booking.update(booking_params)
  #   redirect_to bookings_path
  # end

  # def destroy
  #   @booking.destroy
  #   redirect_to bookings_path
  # end

  def approve
     @booking.status = "approved"
     @booking.save!
     redirect_to dashboard_bookings_path
  end

  def reject
     @booking.status = "rejected"
     @booking.save!
     redirect_to dashboard_bookings_path
  end

  private
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:message, :status, :start_date, :end_date, :car_id, :user_id)
  end
end
