class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = Review.joins(:booking).where("bookings.user_id = #{@user.id} and reviews.ownership = true")
  end
end
