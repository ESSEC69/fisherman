class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end
  def show
    @spot = Spot.find(params[:id])
    @reviews = Review.joins(:booking).where("bookings.spot_id = #{@spot.id} and reviews.ownership = false")
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
    params.require(:spot).permit(:title, :description, :price_per_day, :street_number, :street, :postal_code, :city, :photo, :photo_cache)
  end
end
