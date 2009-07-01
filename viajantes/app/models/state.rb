class State < ActiveRecord::Base
	#Country: country
	#Region: region
	#String: symbol
	#String: name

	belongs_to :country
	belongs_to :region
end
