class City < ActiveRecord::Base
	#State: state
	#String: name
	belongs_to :state
end
