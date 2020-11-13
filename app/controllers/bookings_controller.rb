class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @booking = policy_scope(Booking)

    @markers = @bookings.map do |booking|
      {
        lng: booking.longitude,
        lat: booking.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { booking: booking }),
      }
    end 
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

    if @booking.update(mover.params)
      redirect_to @booking
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :type_of_car, :description, :price, :date_time, :start_point, :end_point)
  end
end
