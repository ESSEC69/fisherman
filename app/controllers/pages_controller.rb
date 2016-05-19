class PagesController < ApplicationController
  def home
    @spots = Spot.all.sample(3)
  end
end
