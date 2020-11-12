class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @booking = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @mover = Mover.find(params[:mover_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @mover = Mover.find(params[:mover_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.mover = @mover
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking

    if @booking.update(booking_params)
      redirect_to "/mover/bookings"
    else
      render "/mover/bookings"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :type_of_car, :description, :price, :status, :date_time, :start_point, :end_point)
  end
end
