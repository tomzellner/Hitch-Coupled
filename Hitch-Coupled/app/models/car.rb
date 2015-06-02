class Car < ActiveRecord::Base
	 validates_presence_of :make, :model, :year, :type_of, :seats
	 validates :seats, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 7}

	belongs_to :user
	has_many :trips


end
