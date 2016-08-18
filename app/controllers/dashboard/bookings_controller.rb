class Dashboard::BookingsController < ApplicationController
  before_action :set_booking, only: [:approve, :reject]

  def index
    @bookings = Booking.all
  end

  def approve
     @booking.status = "Accepted"            # as soon as the owner approves a booking, the status changes to Accepted"
     @booking.save!
     redirect_to dashboard_bookings_path
  end

  def reject
     @booking.status = "Rejected"           # as soon as the owner approves a booking, the status changes to Rejected"
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
