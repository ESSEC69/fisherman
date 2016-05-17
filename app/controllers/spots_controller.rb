class SpotsController < ApplicationController
  def index
  end
  def show
    @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user
    if @spot.save
      redirect_to spot_path(@spot)
    else
      render :new
    end
    # @spot.save
    # redirect_to spot_path(@spot)
  end



  private

  def spot_params
    params.require(:spot).permit(:title, :description, :price_per_day, :street_number, :street, :postal_code, :city)
  end
end