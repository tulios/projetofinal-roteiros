class TouristSight < ActiveRecord::Base
	#String: name
	#String: address
	#String: description
	#City: city

	belongs_to :city

	validates_presence_of :city, :name, :address
end
