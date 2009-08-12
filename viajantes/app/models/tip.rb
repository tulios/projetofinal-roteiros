class Tip < ActiveRecord::Base
	# String name
	# Text description
  # TouristSight: tourist_sight
	# User: user
	
	
	belongs_to :tourist_sight
	belongs_to :user
	validates_associated :tourist_sight
	validates_presence_of :name, :description, :tourist_sight
	validates_length_of :name, :in => 5..50 
end
