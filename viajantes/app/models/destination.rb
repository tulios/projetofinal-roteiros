# Destination - Destino
#
# Este modelo representa um dos vários destinos possíveis 
# em um roteiro de viagem (Roadmap).
#
# Atributos:
# 	Float: planned_cost (Custo planejado para o destino)
# 	Date: start_date (Data de início)
# 	Date: end_date (Data de fim)
# 	Vehicle: vehicle (O meio de transporte utilizado para se chegar a este destino)
# 	Roadmap: roadmap (Roteiro de viagem o qual este destino pertence)
# 	City: city (Cidade do destino)
# 	Program: programs (Programas planejados a serem executados neste destino)
#
class Destination < ActiveRecord::Base
  
	has_many :programs, :order => "date asc"
  
  belongs_to :roadmap
  belongs_to :vehicle
  belongs_to :city
  
  validates_presence_of :roadmap, :city_id
  validates_presence_of :start_date, :if => "end_date"
  validates_presence_of :end_date, :if => "start_date"
  
  # Verifica se a data de início (start_date) ocorre antes
  # da data de fim (end_date). Adiciona uma mensagem de erro
  # em errors caso end_date venha antes de start_date.
  #
  def validate
    if(start_date and end_date)
      errors.add(:end_date, "deve ser antes da data se início.") if end_date < start_date
    end
  end
  
  # Calcula o número de dias neste destino (end_date - start_date). 
  # Caso as datas nao tenham sido informadas sera retornado zero (0).
	#
  def number_of_days
    if end_date and start_date
      return end_date - start_date
    end
  
    0
  end

	# Cálcula o total gasto neste destino. O cálculo é realizado através
	# da soma do valor de todos os programas (program) adicionados.
	#
	def total
		sum = 0.0

    if programs and programs.length > 0
		  programs.each do |program|
			  sum += program.value
		  end
    end

		sum
	end

	# Cálcula o saldo do destino, o total dos programas adicionados 
	# subtraido do custo planejado (planned_cost - total).
	#
	def balance
		planned_cost - total
	end

end
