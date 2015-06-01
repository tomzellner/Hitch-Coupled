class Trip < ActiveRecord::Base
	belongs_to :car



	belongs_to :driver, foreign_key: 'driver_id', class_name: "User"

	has_many :passengers, through: :rider_relationships, class_name: "User"
	has_many :rider_relationships, foreign_key: 'trip_id'
  has_many :conversations
end
