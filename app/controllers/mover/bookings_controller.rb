class Mover::BookingsController < ApplicationController  
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @booking = policy_scope(Booking)
  end

  def update
    @booking = Booking.find(params[:id])
  end


end
