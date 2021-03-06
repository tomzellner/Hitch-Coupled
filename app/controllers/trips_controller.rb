class TripsController < ApplicationController
	def add_passenger
		@trip = Trip.find(params[:trip_id])
		# rider = RiderRelationship.create(trip_id: @trip.id, passenger_id: current_user.id)
		if @trip.passengers.length < @trip.num_passengers && !@trip.passengers.include?(User.find(:passenger_id))
			@trip.passengers << User.find(:passenger_id)
			redirect_to @trip
		else
			redirect_to '/'
		end
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
		@car = Car.new
		@user = current_user
		@trip = Trip.new
		respond_to do |format|

	      
	      format.html { render "trips/new", :layout => false  }
	  end
	end

	def create
		@user = current_user
		@car = Car.new
		@trip = Trip.new(trip_params)
		if !@trip.car
			@trip.car = current_user.car.last
		end

		@trip.driver = current_user
		respond_to do |format|
			if @trip.save
	      format.html {redirect_to @trip}
	      format.json { render :json => @trip }

			else
			format.html { render action: 'new' }
        	format.json { render :json => @trip.errors.full_messages, :status => :unprocessable_entity }
			end
		end

	end


	def show
		@user = current_user
		@trip = Trip.where(id: params[:id]).first
		@driver = @trip.driver
		@rating = Rating.new
		@conversation = Conversation.new
		@car = @trip.car

		# if @trip
		# 	render json: {trip: trip}
		# else
		# 	status 400
		# end

	end



	def index
			@search = Search.new
			@trips = Trip.where(started: false)
		
		respond_to do |format|
      		format.html
      		format.json { render :json => @trips }
    	end
	end



	def update
		@trip = Trip.find(params[:id])
    	respond_to do |format|
		if @trip.update_attributes(trip_params)
	      format.html {redirect_to @trip}
	      format.json { render :json => @trip }

		else
			format.html { redirect_to @trip }
        	format.json { render :json => @trip.errors.full_messages, :status => :unprocessable_entity }
		end
	end

	end



	def edit
		@trip = Trip.find(params[:id])
		@car = @trip.car
		@user = current_user



	end



	def destroy
		Trip.find(params[:id]).destroy
	end

	private

	def trip_params
      params.require(:trip).permit(:start_city, :start_state, :end_city, :end_state, :start_date, :end_date, :num_passengers, :driver_id, :car_id,)
  end


end
