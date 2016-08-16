class Dashboard::BookingsController < ApplicationController
  before_action :set_booking, only: [:approve, :reject]

  def index
    @bookings = Booking.all
  end

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
