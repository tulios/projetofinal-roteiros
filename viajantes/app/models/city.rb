# City - Cidade
#
# Este modelo representa as cidades.
#
# Atributos:
#   State: state (Estado o qual a cidade pertence)
#   String: name (Nome da cidade)
#
class City < ActiveRecord::Base

	belongs_to :state
	
	# Carrega todas as cidades de um determinado estado.
	# params:
	#		- Integer: state_id (Identificador do estado)
	#
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
