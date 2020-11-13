class MoversController < ApplicationController

  def index
    if params[:query].present? && params[:start_point].present?
      @movers = policy_scope(Mover).search_by_type_of_car(params[:query]).near(params[:start_point], 10)
    elsif params[:query].present?
      @movers = policy_scope(Mover).search_by_type_of_car(params[:query])
    elsif params[:start_point].present?
      @movers = policy_scope(Mover).near(params[:start_point], 10)
    else
    # @movers = Mover.all
      @movers = policy_scope(Mover).order(created_at: :asc)
    end
    # authorize @mover
    @mover = policy_scope(Mover)
  end

  def show
    @mover = Mover.find(params[:id])
    @booking = Booking.new
    authorize @mover
  end

  def new
    @mover = Mover.new
    authorize @mover
  end

  def create
    @mover = Mover.new(mover_params)
    @mover.user = current_user #anytime it is logged in, call it current_user
    authorize @mover
    if @mover.save
      redirect_to mover_path(@mover)
    else
      render :new
    end
  end

  def destroy

  end

  private

  def mover_params
    params.require(:mover).permit(:name, :type_of_car, :description, :price, :image, :address)
  end
end
