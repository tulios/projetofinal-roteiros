# State - Estado
# 
# Este modelo representa os estados.
# 
# Atributos:
#   Region: region (A região a qual o estado pertence)
#   String: symbol (A sliga do estado)
#   String: name (O nome do estado)
# 
class State < ActiveRecord::Base
	belongs_to :region
  
  def country
    region.country
  end
	
	# Carrega todos os estados do Brasil
	#
	def self.load_all
		
		State.all(:conditions => ["country_id = ?", 1], 
							:joins => :region,
							:order => "name asc")
	end
end
