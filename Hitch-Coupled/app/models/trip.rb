class Trip < ActiveRecord::Base



	# geocoded_by :city   # can also be an IP address
	# after_validation :geocode          # auto-fetch coordinates


	belongs_to :car



	belongs_to :driver, foreign_key: 'driver_id', class_name: "User"

	has_many :passengers, through: :rider_relationships, class_name: "User"
	has_many :rider_relationships, foreign_key: 'trip_id'
  has_many :conversations
end
