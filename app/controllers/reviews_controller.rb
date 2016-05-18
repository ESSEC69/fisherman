class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:spot_id])
  end

end
