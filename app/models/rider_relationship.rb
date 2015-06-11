class RiderRelationship < ActiveRecord::Base
	belongs_to :trip
	belongs_to :passenger, foreign_key: "passenger_id", class_name: "User"
end
