# Event - Evento
# 
# Este modelo representa os eventos. 
# Exemplos de eventos são: shows, festas, peças, de teatros e etc.
# 
# Atributos:
#   City: city (Cidade onde o evento irá ocorrer)
#   String: name (Nome do evento)
#   Timestamp: time (A hora e dia em que o evento irá ocorrer)
#   String: address (O endereço onde o evento irá ocorrer)
#   Float: cost (O custo do evento)
#   String: description (Descrição do evento)
#
class Event < ActiveRecord::Base

  belongs_to :city
  belongs_to :user
	validates_presence_of :city_id, :name, :time
		
	# Realiza uma consulta paginada pelas dicas do evento 
	# ordenadas por data de criação.
	#
	#   params:
	#     - Integer: page (pagina atual da paginação)
	#     - Ineger: per_page (número de registros por página)
	#
	def tips(page = 1, per_page = Config::PAGE_SIZE)
		Tip.paginate(
			:select => "*, et.id as especified_type",
			:joins => "inner join event_tips et on et.tip_id = tips.id",
			:conditions => ["et.event_id = ?", id],
    	:per_page => per_page,
    	:page => page,
    	:order => "created_at desc"
		)
	end

  # Realiza uma consulta pelas avaliações do evento 
  # retornando uma avaliação com os valores médios 
  # das notas atribuídas para cada críterio de avaliação.
  #
	def evaluation_average
		hash = {}
		Evaluation.rates.each do |rate|
			hash[rate] = Evaluation.average(
				rate, :conditions => ["ee.event_id = ?", id],
							:joins => "inner join event_evaluations ee on ee.evaluation_id = evaluations.id"
			)
		end
		
		Evaluation.new(hash)
	end
	
	# Realiza uma consulta paginada pelas avaliações 
	# do evento, ordenadas pela data de criação.
	# 
	#   params:
	#     - Integer: page (pagina atual da paginação)
	#     - Ineger: per_page (número de registros por página)
	#  
	def evaluations(page = 1, per_page = Config::PAGE_SIZE)
		
		Evaluation.paginate(
			:select => "*, ee.id as especified_type",
			:conditions => ["event_id = ?", id],
			:joins => "inner join event_evaluations ee on ee.evaluation_id = evaluations.id",
    	:per_page => per_page,
    	:page => page,
    	:order => "created_at desc"
		)
	end              
	
	# Recupera todos os eventos com o título parecido com o valor informado.
	#
	# params:
	#		- String: value (O valor pesquisado)
	# 	- Integer: per_page (O tamanho máximo da página retornada)
	#		- Integer: page (O número da página retornada)
	#
	def self.find_like_name(value, per_page = Config::PAGE_SIZE, page = 1, city_id = nil)
	  if city_id
	    cond = ["(Lower(name) like ?) and city_id = ?", 
	            "%#{value.downcase}%", city_id]
	  else
		  cond = ["Lower(name) like ?", "%#{value.downcase}%"]
		end
		Event.paginate(:conditions => cond, 
									 :per_page => per_page, 
									 :page => page)
	end

end



















