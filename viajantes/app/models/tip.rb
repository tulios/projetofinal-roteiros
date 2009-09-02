class Tip < ActiveRecord::Base
	# String name
	# Text description
  # TouristSight: tourist_sight
	# User: user
	
	belongs_to :user
	validates_presence_of :name, :description
	validates_length_of :name, :in => 5..50 
	
	def especified_type
  	Integer(read_attribute('especified_type'))
  end
end
