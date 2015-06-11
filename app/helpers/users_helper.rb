module UsersHelper
	def rated_avg
		object_array = User.find(params[:id]).rated_ratings
			num_array = []
		object_array.each do |rating|
			num_array << rating.score
		end
		@avg = num_array.inject{ |sum, n| sum + n }.to_f / object_array.size

		return @avg
	end
	
end
