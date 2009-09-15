# State - Estado
# 
# Este modelo representa os estados.
# 
# Atributos:
#    - Country: country (O país o qual o estado pertence)
#    - Region: region (A região a qual o estado pertence)
#    - String: symbol (A sliga do estado)
#    - String: name (O nome do estado)
# 
class State < ActiveRecord::Base
	belongs_to :country
	belongs_to :region
	
	# Carrega todos os estados do Brasil
	#
	def self.load_all
		State.find_all_by_country_id(1, :order => "name asc")
	end
end
