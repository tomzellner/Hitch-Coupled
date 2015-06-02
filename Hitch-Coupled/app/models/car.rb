class Car < ActiveRecord::Base
	 validates_presence_of :make, :model, :year, :type_of, :seats
	 validates :seats, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 7}


	before_save :tileize_info
	before_create :tileize_info



	def tileize_info
		self.make = self.make.titleize
		self.model = self.model.titleize
		self.type_of = self.end_city.titleize
	end


	belongs_to :user
	has_many :trips


end
