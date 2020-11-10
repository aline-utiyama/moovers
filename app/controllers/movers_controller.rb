class MoversController < ApplicationController
  
  def index
    # @movers = Mover.all
    @movers = policy_scope(Mover).order(created_at: :desc)
    # authorize @mover
    @mover = policy_scope(Mover)
  end
  
  def show
    @mover = Mover.find(params[:id])
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
      render 'new'
    end
  end
  
  private
  def mover_params
    params.require(:mover).permit(:name, :type_of_car, :description, :price)
  end
  

end
