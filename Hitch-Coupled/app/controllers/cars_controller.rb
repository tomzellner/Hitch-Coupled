class CarsController < ApplicationController
	def new
		@car = Car.new

	end

	def create
		
		@car = Car.new(car_params)
		@car.user = current_user

		respond_to do |format|
			if @car.save
			      format.html {redirect_to "/"}
			      format.json { render :json => @car }
				
			else
				status 400
			end
		end

		

	end

	def show
		car = Car.where(id: params[:id]).first
		if car
			render json: {car: car}
		else
			status 400
		end

	end



	def index
		cars = Car.all
		render json: {cars: cars}

	end



	def update
		car = Car.find(params[:id])
    if car.update_attributes(car_params)
      render json: {car: car}
    else
      render 'edit'
    end

	end



	def edit

	end



	def destroy
		Car.find(params[:id]).destroy
	end

	private

	def car_params
      params.require(:car).permit(:seats, :make, :model, :type, :year)
    end
end
