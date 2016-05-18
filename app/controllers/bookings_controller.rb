class BookingsController < ApplicationController

  before_action :find_spot, only: [:new, :create]
  before_action :find_booking, only: [:update]


  def index

    @bookings = Booking.where("user_id = #{current_user.id}")
    @locations = Booking.joins(:spot).where('spots.user_id > 0')


    # find bookings spots_id where user_id du spots =
  end
  def new
    @booking = Booking.new()
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.spot = @spot
    @booking.price = @booking.number_of_day * @spot.price_per_day
    @booking.status = "En attente de confirmation"
    @booking.user_id = current_user.id

    if @booking.save
      redirect_to spot_path(@spot.id)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @booking.update(update_params)
    redirect_to bookings_path()


  # si owner = current_user / bookings
  # si staus = encours
  # 2 bouton : valider ou refusé
  # update hidden form dans dispaly
  # si user_id = current_user update only @bookings.each : booking.status

  end

  def destroy
  end


  private

  def find_booking
     @booking = Booking.find(params[:id])
  end

  def booking_params
    hash = params.require(:booking).permit(:checkin, :number_of_people, :number_of_day)
    hash[:number_of_people] = hash[:number_of_people].to_i
    hash[:number_of_day] = hash[:number_of_day].to_i
    return hash
  end

  def update_params
    params.require(:booking).permit(:status)
  end

  def find_spot
    @spot = Spot.find(params[:spot_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
