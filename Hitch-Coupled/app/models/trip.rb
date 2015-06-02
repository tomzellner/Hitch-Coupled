class Trip < ActiveRecord::Base
	validates_presence_of :start_city, :start_state, :end_city, :end_state, :start_date,  :num_passengers, :driver_id, :car_id
	validate :start_date_future
	validate :ends_after

	before_save :tileize_info
	before_create :tileize_info

	def start_date_future
		if start_date.present? && start_date < Date.today 
		errors.add(:start_date, "can't be in the past")
		end
	end

	def ends_after
		if start_date.present? && end_date <= start_date 
		errors.add(:end_date, "can't be before start date")
		end

	end

	def tileize_info
		self.start_city = self.start_city.titleize
		self.start_state = self.start_state.titleize
		self.end_city = self.end_city.titleize
		self.end_state = self.end_city.titleize
	end

##################################################
#SEARCH###########################################
##################################################
	def self.search(start_city_search, end_city_search)
	  if search
	    where('start_city LIKE ? AND end_city LIKE ?', "%#{start_city_search}%, %#{end_city_search}% ")
	  else
	    find(:all)
	  end
end






	# geocoded_by :city   # can also be an IP address
	# after_validation :geocode          # auto-fetch coordinates


	belongs_to :car
	belongs_to :driver, foreign_key: 'driver_id', class_name: "User"

	has_many :passengers, through: :rider_relationships, class_name: "User"
	has_many :rider_relationships, foreign_key: 'trip_id'
  has_many :conversations
end
