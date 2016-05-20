class PagesController < ApplicationController
  def home
    if Spot.all.length < 3
      @spots = nil
    else
      @spots = Spot.all.sample(3)
    end
  end
end
