class State < ActiveRecord::Base
	#Country: country
	#Region: region
	#String: symbol
	#String: name

	belongs_to :country
	belongs_to :region
	
	# Carrega todos os estados do Brasil
	def self.load_all
		State.find_all_by_country_id(1, :order => "name asc")
	end
end
