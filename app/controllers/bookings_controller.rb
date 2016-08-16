class BookingsController < ApplicationController
  # before_action :set_booking, only: [:show, :edit, :update]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save!
    redirect_to dashboard_bookings_path
  end


  private
  # def set_booking
  #   @booking = Booking.find(params[:id])
  # end

  def booking_params
    params.require(:booking).permit(:message, :status, :start_date, :end_date, :car_id, :user_id)
  end
end
