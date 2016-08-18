class BookingsController < ApplicationController
  # before_action :set_booking, only: [:show, :edit, :update]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)  # we pass the params values during the creation of a booking
    @booking.user = current_user            # we assign the current user to the booking
    @booking.car_id = params[:car_id]       # we assing the car id to the booking through the params
    @booking.status = "Pending"             # we assign a default state at the status, which shoul match the validations
    @booking.save!
    redirect_to dashboard_bookings_path     # we redirect back to the dashboard
  end

  private
  # def set_booking
  #   @booking = Booking.find(params[:id])
  # end

  def booking_params
    params.require(:booking).permit(:message, :status,:start_date, :end_date, :car_id, :user_id)
  end
end
