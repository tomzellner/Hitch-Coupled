module CarsHelper
	def current_user_cars
		car_array = []
		current_user.cars.each do |car|
			car_array << ["#{car.make}  #{car.model}" ,car.id]
		end

		car_array

	end

	def type_of_cars
		['Sedan', 'Truck', 'Compact', 'SUV', 'Convertable', 'Van', 'Mini-Van']

	end


end
