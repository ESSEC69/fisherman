class BookingsController < ApplicationController

  def new
    @booking = Booking.new()
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.spot = @spot

    if @booking.save
      redirect_to spot_path(@spot.id)
    else
      render :new
    end


  end


  private

  def booking_params
    params.require(:booking).permit(:checkin, :checkout, number_of_people:, number_of_days: )
  end

  def find_spot
    @spot = Spot.find(params[:spot_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
