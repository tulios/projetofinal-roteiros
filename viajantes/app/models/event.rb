# Event - Evento
# 
# Este modelo representa os eventos. 
# Exemplos de eventos são: shows, festas, peças, de teatros e etc.
# 
# Atributos:
#  City: city (Cidade onde o evento irá ocorrer)
#  String: name (Nome do evento)
#  Timestamp: time (hora e dia em que o evento irá ocorrer)
#  TouristSight: tourist_sight (Ponto Turístico onde o evento acontece, se for o caso)
#  Boolean: cost (Representa se o evento tem custo)
#  String: description (Descrição do evento)
#
class Event < ActiveRecord::Base

  belongs_to :city
  belongs_to :tourist_sight
  belongs_to :shop

	validates_presence_of :city_id, :name, :time

	attr_accessor :happens_in
	
	# Variável de classe com as opções onde o evento pode acontecer
	#
	@@happens_in_options = {:tourist_sight => "Ponto Turístico",
													:shop => "Estabelecimento",
													:another => "Outro"}

  # Método acessor para happens_in_options
  #
	def self.happens_in_options
		@@happens_in_options
	end

  # Retorna um simbolo que representa se o evento ocorrerá em 
  # em um tourist_sight, shop ou another (outro).
  #
	def happens_in
		if tourist_sight
			@happens_in = :tourist_sight
		elsif shop
			@happens_in = :shop
		else
			@happens_in = :another 
		end

		@happens_in
	end
	
	# Realiza uma consulta paginada pelas dicas do evento 
	# ordenadas por data de criação.
	#
	#   params:
	#     - Integer: page (pagina atual da paginação)
	#     - Ineger: per_page (número de registros por página)
	#
	def tips(page = 1, per_page = 5)
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
	def evaluations(page = 1, per_page = 5)
		
		Evaluation.paginate(
			:select => "*, ee.id as especified_type",
			:conditions => ["event_id = ?", id],
			:joins => "inner join event_evaluations ee on ee.evaluation_id = evaluations.id",
    	:per_page => per_page,
    	:page => page,
    	:order => "created_at desc"
		)
	end

end



















