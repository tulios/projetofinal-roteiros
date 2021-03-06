# Shop - Estabelecimento
#
# Este modelo representa um estabelecimento comercial.
# Ex: restaurantes, hotéis, clubes, etc.
#
# Atributos:
# 	String: name (O nome do estabelecimento)
# 	String: address (endereço)
# 	String: phone (telefone)
#   String: fax
#   String: email (E-mail de contato)
#   String: site
# 	Text: description (A descrição do estabelecimento)
#   Text: additional_info (Informações adicionais, por exemplo, preços, etc.)
# 	String: key_words (Palavras-chave que identificam o estabelecimento)
# 	City: city (A cidade na qual o estabelecimento pertence)
# 	TouristSight: tourist_sight (O possível ponto-turístico que este estabelecimento pode estar vinculado)
# 	User: user (O usuário que cadastrou o estabelecimento)
# 	Integer: hits (O número de acessos a esse estabelecimento)
#
class Shop < ActiveRecord::Base

  belongs_to :city
  belongs_to :tourist_sight
  belongs_to :user
  
	validates_presence_of :city_id, :name, :address
	validates_format_of   :email, :allow_nil => true, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,}\Z)/

  # Realiza uma consulta pelas avaliações do estabelecimento 
  # retornando uma avaliação com os valores médios 
  # das notas atribuídas para cada críterio de avaliação.
  #
	def evaluation_average
		hash = {}
		Evaluation.rates.each do |rate|
			hash[rate] = Evaluation.average(
				rate, :conditions => ["se.shop_id = ?", id],
							:joins => "inner join shop_evaluations se on se.evaluation_id = evaluations.id"
			)
		end
		
		Evaluation.new(hash)
	end
	
	# Realiza uma consulta paginada pelas avaliações 
	# do estabelecimento, ordenadas pela data de criação.
	# 
	#   params:
	#     - Integer: page (pagina atual da paginação)
	#     - Ineger: per_page (número de registros por página)
	#  
	def evaluations(page = 1, per_page = Config::PAGE_SIZE)
		Evaluation.paginate(
			:select => "*, se.id as especified_type",
			:conditions => ["shop_id = ?", id],
			:joins => "inner join shop_evaluations se on se.evaluation_id = evaluations.id",
    	:per_page => per_page,
    	:page => page,
    	:order => "created_at desc"
		)
	end
	
	# Realiza uma consulta paginada pelas dicas 
	# do estabelecimento, ordenadas pela data de criação.
	# 
	#   params:
	#     - Integer: page (pagina atual da paginação)
	#     - Ineger: per_page (número de registros por página)
	#  
	def tips(page = 1, per_page = Config::PAGE_SIZE)
		Tip.paginate(
			:select => "*, st.id as especified_type",
			:joins => "inner join shop_tips st on st.tip_id = tips.id",
			:conditions => ["st.shop_id = ?", id],
    	:per_page => per_page,
    	:page => page,
    	:order => "created_at desc"
		)
	end

	# Aumenta o número de acessos em 1.
	#
  def increase_hits
	  self.update_attributes(:hits => self.hits + 1)
	end
  
  # Verifica se a última avaliação feita pelo usuário a este estabelecimento
  # foi a um número de dias igual ao período.
	#
	# params:
	#		- User: user (O usuário que deseja avaliar)
	#		- symbol: period (Valor padrão :week,
	#                     valores possívels :day => 0, :week => 7, :month => 30, :year => 365)
	#
  def already_evaluated?(user, period = :week, today = DateTime.now)                    
     
     metrics = {:day => 0, :week => 7, :month => 30, :year => 365}                
     
     evaluation = Evaluation.paginate(
              			:conditions => ["shop_id = ?", id],
              			:joins => "inner join shop_evaluations se on se.evaluation_id = evaluations.id",
                 	  :per_page => 1,
                 	  :page => 1,
                 	  :order => "created_at desc"
              		) 
                                          
     if evaluation.nil? or evaluation.length == 0
       return false
     end
                                        
     date_creation = Converters::to_date(Converters::date_to_string(evaluation[0].created_at))
     today = Converters::to_date(Converters::date_to_string(today))
     
     days = (today - date_creation)
     
     days <= metrics[period]     
  end          
    
  # Verifica se existe algum programa associado a este estabelecimento
  #
  def has_programs_associated?
    count = Program.count(:conditions => ["shop_id = ?", id])
    
    if count > 0
      return true
    end
    
    false
  end

	# Recupera todos os estabelecimentos com o nome ou as 
	# palavras-chave parecidas com o valor informado.
	#
	# params:
	#		- String: value (O valor pesquisado)
	# 	- Integer: per_page (O tamanho máximo da página retornada)
	#		- Integer: page (O número da página retornada)
	#
	def self.find_like_name_or_key_word(value, per_page = Config::PAGE_SIZE, page = 1, city_id = nil)
	  if city_id
	    cond = ["(Lower(name) like ? or Lower(key_words) like ?) and city_id = ?",
	            "%#{value.downcase}%", "%#{value.downcase}%", city_id]
	  else
		  cond = ["Lower(name) like ? or Lower(key_words) like ?", "%#{value.downcase}%", "%#{value.downcase}%"]
		end
		Shop.paginate(:conditions => cond, 
									:per_page => per_page, 
									:page => page)
	end
	
end
  



















