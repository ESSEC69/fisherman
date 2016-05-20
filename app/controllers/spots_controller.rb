class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def search
    # récupération des parametres dans l'url
    params[:q] == "" ? nearby = "France" : nearby = params[:q]
    params[:radius] == "" ? radius = "500" : radius = params[:radius]
    price = params[:price]

    # slect on maps
    @spots_results = Spot.near(nearby, radius)
    unless price == "all"
      # slectionner les bons prix
      case price
      when "min"
        @spots_results= @spots_results.select { |spot| spot.price_per_day < 25}
      when "medmin"
        @spots_results= @spots_results.select { |spot| (spot.price_per_day >= 25) && (spot.price_per_day < 50)}
      when "medmax"
        @spots_results= @spots_results.select { |spot| (spot.price_per_day >= 50) && (spot.price_per_day < 100)}
      when "max"
        @spots_results= @spots_results.select { |spot| spot.price_per_day > 100}
      end
    end

    # pagination
    @spots_results = @spots_results.sort_by{|spot| -spot.rating}
    Kaminari.paginate_array(@spots_results).page(params[:page])

    @markers = Gmaps4rails.build_markers(@spots_results) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
      marker.infowindow render_to_string(:partial => "/spots/map_box", locals: {spot: spot})
    end
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
      # appelle le SpotMailer pour envoyer le mail de confirmation de création
      SpotMailer.creation_confirmation(@spot).deliver_now
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
