class Rating < ActiveRecord::Base
	belongs_to :rater, foreign_key: "rater_id", :class_name => "User"
	belongs_to :rated, foreign_key: "rated_id", :class_name => "User"
end
