class BookingsController < ApplicationController

  before_action :find_spot, only: [:new, :create]

  def new
    @booking = Booking.new()
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.spot = @spot
    @booking.price = @booking.number_of_day * @spot.price_per_day
    @booking.status = "En attente de confirmation"


    if @booking.save
      redirect_to spot_path(@spot.id)
    else
      render :new
    end
  end

  def edit

  end

  def update

  # si owner = current_user / bookings
  # si staus = encours
  # 2 bouton : valider ou refusé
  # update hidden form dans dispaly
  # si user_id = current_user update only @bookings.each : booking.status

  end

  def destroy
  end


  private

  def booking_params
    hash = params.require(:booking).permit(:checkin, :number_of_people, :number_of_day)
    hash[:number_of_people] = hash[:number_of_people].to_i
    hash[:number_of_day] = hash[:number_of_day].to_i
    return hash
  end

  def find_spot
    @spot = Spot.find(params[:spot_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
