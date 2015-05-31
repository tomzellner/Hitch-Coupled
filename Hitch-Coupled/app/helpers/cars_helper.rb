module CarsHelper
	def current_user_cars
		car_array = []
		current_user.cars.each do |car|
			car_array << car.id
		end

		car_array

	end
end
