class TouristSight < ActiveRecord::Base
	#String: name
	#String: address
	#String: description
	#State: state

	belongs_to :state
	belongs_to :city
end
