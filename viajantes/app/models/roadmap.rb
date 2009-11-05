# Roadmap - Roteiro
#
# Este modelo representa um roteiro de viagem. O planejamento completo
# de uma viagem. É o agregador de destinos (destination).
#
# Atributos:
# 	String: title (O título deste roteiro)
# 	Text: description (A descrição do roteiro)
# 	City: city (O ponto de partida deste roteiro)
# 	Boolean: public (Se este é um roteiro que pode ser visualizado por outros usuários)
#
class Roadmap < ActiveRecord::Base

	belongs_to :city
	belongs_to :user
	has_many :destinations, :order => "start_date", :limit => Config::PAGE_SIZE, :dependent => :destroy

	validates_presence_of :city_id, :title

	# Recupera todos os roteiros com o título parecido com o valor informado.
	#
	# params:
	#		- String: value (O valor pesquisado)
	# 	- Integer: per_page (O tamanho máximo da página retornada)
	#		- Integer: page (O número da página retornada)
	#
	def self.find_like_title(value, per_page = Config::PAGE_SIZE, page = 1, city_id = nil)
	  if city_id
	    cond = ["(Lower(title) like ? and public = ?) and city_id = ?", 
	            "%#{value.downcase}%", "#{true}", city_id]
	  else
		  cond = ["Lower(title) like ? and public = ?", "%#{value.downcase}%", "#{true}"]
		end
		Roadmap.paginate(:conditions => cond, 
										 :per_page => per_page, 
										 :page => page)
	end

	# Cálcula o custo total planejado para o roteiro. Soma o custo
	# planejado de todos os destinos adicionados.
	#
  def total_planned_cost
    cost = 0.0
    
    if destinations and destinations.length > 0
      destinations.each do |dest|
        cost += dest.planned_cost
      end
    end
    
    cost      
  end
  
  # Cálcula o custo total para o roteiro. Soma o custo
	# total de todos os destinos adicionados.
	#
  def total_actual_cost
     cost = 0.0
    
    if destinations and destinations.length > 0
      destinations.each do |dest|
        cost += dest.total
      end
    end
    
    cost
  end
  
  # Cálcula o saldo do roteiro. Subtrai o custo total atual (total_actual_cost)
  # do custo total planejado (total_planned_cost).
	#
  def balance
    total_planned_cost - total_actual_cost
  end

	# Cálcula o número total de dias deste roteiro. Soma o número de dias (number_of_days)
	# de todos os destinos (destination) adicionados.
	#
	def total_of_days
		total = 0
				
		if destinations and destinations.length > 0
      destinations.each do |destination|
        total += destination.number_of_days
      end
    end
		
		total
	end

end


















