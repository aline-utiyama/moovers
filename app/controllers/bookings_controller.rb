class BookingsController < ApplicationController

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
  
  def index
    
  end

  def update
    
  end
  

  # def mover?
    
  # end
  
  
  private booking_params
    params.require(:booking).permit(:name, :type_of_car, :description, :price)
  end
end
