class Search < ActiveRecord::Base
	def trips
	  @trips ||= find_trips
	end

	private

	def find_trips
	  trips = Trip.all
	  trips = trips.where("start_city like ?", "%#{start_city}%") if start_city.present?
	  trips = trips.where("start_state like ?", "%#{start_state}%") if start_state.present?
	  trips = trips.where("end_city like ?", "%#{end_city}%") if end_city.present?
	  trips = trips.where("end_state like ?", "%#{end_state}%") if end_state.present?
	  p'************************************' 
	  p trips
	end
end
