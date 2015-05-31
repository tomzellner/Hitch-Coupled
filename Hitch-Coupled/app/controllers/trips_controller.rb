class TripsController < ApplicationController
	def add_passenger
		@trip = Trip.find(params[:trip_id])
		rider = RiderRelationship.create(trip_id: @trip.id, passenger_id: current_user.id)
		redirect_to @trip
	end

	def start
		@trip = Trip.find(params[:trip_id])
		if current_user == @trip.driver
			@trip.started = true
			@trip.save
			redirect_to @trip
		else
			redirect_to @trip
		end
	end
	def end
		@trip = Trip.find(params[:trip_id])
		if current_user == @trip.driver
			@trip.ended = true
			@trip.save
			redirect_to @trip
		else
			redirect_to @trip
		end
	end




	def new
		@trip = Trip.new
	end

	def create
		@trip = Trip.new(trip_params)

		@trip.driver = current_user
		respond_to do |format|
			if @trip.save
	      format.html {redirect_to @trip}
	      format.json { render :json => @trip }
				
			else
				status 400
			end
		end

	end


	def show
		@trip = Trip.where(id: params[:id]).first
		@driver = @trip.driver
		@rating = Rating.new
		# if @trip
		# 	render json: {trip: trip}
		# else
		# 	status 400
		# end

	end



	def index
		@trips = Trip.all
		respond_to do |format|
      format.html
      format.json { render :json => @trips }
    end

		

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
      params.require(:trip).permit(:start_city, :start_state, :end_city, :end_state, :start_date, :end_date, :num_passengers, :driver_id, :car_id,)
    end


end
