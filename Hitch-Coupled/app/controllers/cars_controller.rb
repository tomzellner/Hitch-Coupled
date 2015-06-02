class CarsController < ApplicationController
require 'imgur'
	def new
		@car = Car.new

	end

	def create
		imgur_client = Imgur.new("57a446e074f93b5")
   	image_path = params[:car][:car_pic].tempfile.path
   	image = Imgur::LocalImage.new(image_path)
  	image_url = imgur_client.upload(image).link
   	puts image_url
   	params[:car][:car_pic] = image_url
		@car = Car.new(car_params)
		@car.user = current_user

		respond_to do |format|
			if @car.save
			      format.json { render :json => @car }
			      format.html {redirect_to "/"}

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
		redirect_to @car.user

	end



	def destroy
		Car.find(params[:id]).destroy
	end

	private

	def car_params
      params.require(:car).permit(:seats, :make, :model, :type_of, :year)
    end
end
