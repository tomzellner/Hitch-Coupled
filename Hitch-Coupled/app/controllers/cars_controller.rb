class CarsController < ApplicationController
	require 'imgur'
	def new
		@car = Car.new

	end
	def create
		puts '*' * 50
		p params[:car][:car_pic]
		@car = Car.new(car_params)
		@car.user = current_user

		if params[:car][:car_pic].nil?
			image_url = 'http://i.imgur.com/8dy2FlX.png'
		else
			imgur_client = Imgur.new("57a446e074f93b5")

		   image_path = params[:car][:car_pic].tempfile.path

		   image = Imgur::LocalImage.new(image_path)
		   image_url = imgur_client.upload(image).link
		end
		   puts image_url
		   params[:car][:car_pic] = image_url
		   @car.car_pic = image_url


		respond_to do |format|
			if @car.save
			      format.json { render :json => @car }
			      format.html {redirect_to "/"}

			else
			format.html { redirect_to @trip }
        	format.json { render :json => @car.errors.full_messages, :status => :unprocessable_entity }
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
      params.require(:car).permit(:seats, :make, :model, :type_of, :year, :car_pic)
    end
end
