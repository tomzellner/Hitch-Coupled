class Trip < ActiveRecord::Base
	has_one :car
	


	belongs_to :driver, foreign_key: 'driver_id', class_name: "User"

	has_many :passengers, through: :rider_relationships, class_name: "User"
	has_many :rider_relationships

end
