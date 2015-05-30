class TripsController < ApplicationController

	def new

	end

	def create
		trip = Trip.new(trip_params)
		if trip.save
			render json: {trip: trip}
		else
			status 400
		end

	end

	def show
		trip = Trip.where(id: params[:id]).first
		if trip
			render json: {trip: trip}
		else
			status 400
		end

	end



	def index
		trips = Trip.all
		render json: {trips: trips}

	end



	def update
		trip = Trip.find(params[:id])
    if trip.update_attributes(trip_params)
      render json: {trip: trip}
    # else
    #   render 'edit'
    end

	end



	def edit

	end



	def destroy
		Trip.find(params[:id]).destroy
	end

	private

	def trip_params
      params.permit(:start_city, :start_state, :end_city, :end_state, :start_date, :end_date, :num_passengers, :driver_id, :car_id,)
    end


end
