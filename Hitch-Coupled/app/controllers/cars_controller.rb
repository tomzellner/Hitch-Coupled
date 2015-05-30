class CarsController < ApplicationController
	def new

	end

	def create
		user = User.where(id: params[:user_id]).first
		car = Car.new(car_params)
		car.user = user
		if car.save
			render json: {car: car}
		else
			status 400
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
      params.permit(:seats, :make, :model, :type, :year)
    end
end
