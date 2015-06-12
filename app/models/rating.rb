class Rating < ActiveRecord::Base
	validates :score, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

	belongs_to :rater, foreign_key: "rater_id", :class_name => "User"
	belongs_to :rated, foreign_key: "rated_id", :class_name => "User"
end
