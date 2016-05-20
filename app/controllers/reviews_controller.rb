class ReviewsController < ApplicationController
  before_action :find_booking, only: [:new, :create]


  def new
    @review = Review.new()
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user = current_user


    if @booking.spot.user == current_user
      @review.ownership = true
    else
      @review.ownership = false
    end

    if @review.save
      @spot = @booking.spot
      @spot.average_rating = @spot.reviews.map(&:rating).reduce(:+).fdiv(@spot.reviews.count).to_i
      @spot.save

      if @review.ownership
        redirect_to show_user_path(@review.booking.user_id)
      else
      redirect_to spot_path(@review.booking.spot_id)
      end
    else
      render :new
    end
  end

  private

  def find_booking
     @booking = Booking.find(params[:booking_id])
  end

  def review_params
      params.require(:review).permit(:content, :rating)
    end

end
