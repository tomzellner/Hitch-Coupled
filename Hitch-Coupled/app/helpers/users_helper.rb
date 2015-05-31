module UsersHelper
	def rated_avg
		all_array = User.find(params[:id]).rated_ratings
			num_array=[]
		all_array.each do |rating|
			num_array << rating.score
		end
		@avg = num_array.inject{ |sum, n| sum + n }.to_f / all_array.size

		return @avg
	end
	
end
