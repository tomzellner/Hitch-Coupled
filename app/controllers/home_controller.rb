class HomeController < ApplicationController
  def index
  	@trip = Trip.new
  	@car = Car.new
  	@user = current_user
  end
end
