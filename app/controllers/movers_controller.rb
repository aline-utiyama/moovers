class MoversController < ApplicationController

  def index
    # @movers = Mover.all
    @movers = policy_scope(Mover).order(created_at: :asc)
    # authorize @mover
    # @mover = policy_scope(Mover)

    # the `geocoded` scope filters only movers with coordinates (latitude & longitude)
    @markers = @movers.geocoded.map do |mover|
      {
        lat: mover.latitude,
        lng: mover.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { mover: mover }),
        image_url: helpers.asset_url('https://img2.pngio.com/drawing-pin-world-map-logo-png-clipart-circle-computer-icons-map-pin-logo-png-728_724.jpg')
      }
    end
  end

  def show
    @mover = Mover.find(params[:id])
    @booking = Booking.new
    authorize @mover

    @markers = [
      {
        lat: @mover.latitude,
        lng: @mover.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { mover: @mover }),
        image_url: helpers.asset_url('https://img2.pngio.com/drawing-pin-world-map-logo-png-clipart-circle-computer-icons-map-pin-logo-png-728_724.jpg')
      }
    ]
  end

  def new
    @mover = Mover.new
  end

  def create
    @mover = Mover.new(mover_params)
    @mover.user = current_user #anytime it is logged in, call it current_user
    if @mover.save
      redirect_to mover_path(@mover)
    else
      render :new
    end
  end

  private

  def mover_params
    params.require(:mover).permit(:name, :type_of_car, :description, :price)
  end
end
