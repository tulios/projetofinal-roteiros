class City < ActiveRecord::Base
	#State: state
	#String: name
	belongs_to :state
	
	# Carrega todas as cidades de um determinado estado.
	# params:
	#		- state_id
	def self.load_all(state_id)
		begin
			# Tenta converter para um inteiro
			id = Integer(state_id)
			return City.find_all_by_state_id(state_id, :order => "name asc")
	
		rescue StandardError => e
			return []
		end
	end
end
