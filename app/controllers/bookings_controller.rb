class BookingsController < ApplicationController
  
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @book = Booking.new(booking_params)
    @booking = Booking.find(params[:booking_id])
    @booking.user = @user
    if @booking.after_save
      redirect_to users_path
    else
      render :new
    end
  end
  
  def update
    @booking = Booking.find(params[:id])

    if @booking.update(mover.params)
      redirect_to @booking
    else
      render 'edit'
    end
  end
    
  private booking_params
    params.require(:booking).permit(:name, :type_of_car, :description, :price)
  end
end
