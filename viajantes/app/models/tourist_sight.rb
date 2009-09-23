# TouristSight - Ponto Turístico
# 
# Este modelo representa os pontos turísticos.
# 
# Atributos:
#	  String: name (O nome do ponto turístico)
#	  String: address (O endereço do ponto turístico)
#	  String: fone (O telefone do ponto turístico)
#	  String: email (O e-mail do ponto turístico)
#	  String: visitation_period (O período de visitação do ponto turístico)
#	  String: description (A descrição do ponto turístico)
#		Tag: tags (Uma lista de tags)
#   Tip: tips (Uma lista de dicas)
#	  City: city (A cidade a qual o ponto turístico pertence)
#	  User: user (O usuário o qual o ponto turístico pertence)
#	  Integer: hits (Quantidade de acessos deste ponto turístico)
#	  
class TouristSight < ActiveRecord::Base
	belongs_to :city
	belongs_to :user
	has_many :tourist_sight_tag
	has_many :tourist_sight_tips, :order => "created_at desc", :limit => 5
	
	has_many :tags, :through => :tourist_sight_tag
	has_many :tips, :through => :tourist_sight_tips

	validates_presence_of :city_id, :name, :address
  validates_format_of   :email, :allow_nil => true, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,}\Z)/

  # Itera as tags passadas por parâmtro e para 
  # cada uma instância e salva uma nova tag.
  #
  #   params:
  #     - Array: new_tags
  #        
	def save_tags(new_tags)
		TouristSightTag.destroy_all(:tourist_sight_id => id)

		new_tags.each do |tag|
			tst = TouristSightTag.new
			tst.tourist_sight = self
			tst.tag = tag
			tst.save
		end
	end
	
	# Realiza uma consulta paginada pelas dicas do 
	# ponto turístico, ordenadas pela data de criação.
	# 
	#   params:
	#     - Integer: page (pagina atual da paginação)
	#     - Ineger: per_page (número de registros por página)
	#  
	def tips(page = 1, per_page = Config::PAGE_SIZE)
		Tip.paginate(
			:select => "*, tst.id as especified_type",
			:conditions => ["tst.tourist_sight_id = ?", id],
			:joins => "inner join tourist_sight_tips tst on tst.tip_id = tips.id",
    	:per_page => per_page,
    	:page => page,
    	:order => "created_at desc"
		)
	end
	
	# Realiza uma consulta pelas avaliações do ponto turístico 
  # retornando uma avaliação com os valores médios 
  # das notas atribuídas para cada críterio de avaliação.
  #
	def evaluation_average
		hash = {}
		Evaluation.rates.each do |rate|
			hash[rate] = Evaluation.average(
				rate, :conditions => ["tse.tourist_sight_id = ?", id],
							:joins => "inner join tourist_sight_evaluations tse on tse.evaluation_id = evaluations.id"
			)
		end
		
		Evaluation.new(hash)
	end
	
	# Realiza uma consulta paginada pelas avaliações 
	# do ponto turístico, ordenadas pela data de criação.
	# 
	#   params:
	#     - Integer: page (pagina atual da paginação)
	#     - Ineger: per_page (número de registros por página)
	#  
	def evaluations(page = 1, per_page = Config::PAGE_SIZE)
		Evaluation.paginate(
			:select => "*, tse.id as especified_type",
			:conditions => ["tourist_sight_id = ?", id],
			:joins => "inner join tourist_sight_evaluations tse on tse.evaluation_id = evaluations.id",
    	:per_page => per_page, 
    	:page => page, 
    	:order => "created_at desc"
		)
	end
	
  #	Soma 1 a hits (quantidade de acessos).
  # 
	def increase_hits
	  self.update_attributes(:hits => self.hits + 1)
	end
	
	# Realiza uma consulta paginada de pontos turísticos 
	# do ponto turístico, ordenados por hits.
	# 
	#   params:
	#     - Integer: city_id (Id da cidade dos pontos turísticos a serem pesquisados)
	#     - Integer: tag_id (Id da tag dos pontos turísticos a serem pesquisados )
	#     - Integer: per_page (número de registros por página)
	#     - Integer: page (pagina atual da paginação)
	#  
	def self.find_all_by_city_and_tag(city_id, tag_id, per_page = Config::PAGE_SIZE, page = 1)
		TouristSight.paginate(:conditions => ["city_id = ? and tags.id = ?", city_id, tag_id], 
													:joins => :tags,
													:per_page => per_page,
													:page => page,
													:order => "hits desc")
	end

  # Realiza uma consulta paginada de 
  # pontos turísticos por nome e cidade (opcional).
	# 
	#   params:
	#     - String: value (Valor usado para pesquisar pelo nome)
	#     - Integer: city_id (Id da cidade dos pontos turísticos a serem pesquisados)     
	#     - Integer: per_page (número de registros por página)
	#     - Integer: page (pagina atual da paginação)
	#  
	def self.find_like_name(value, per_page = Config::PAGE_SIZE, page = 1, city_id = nil)
	  if city_id
	    return TouristSight.paginate(:conditions => ["Lower(name) like ? and city_id = ?",
	                                                 "%#{value.downcase}%", city_id], 
                                   :per_page => per_page, 
                                   :page => page)
	  end
		TouristSight.paginate(:conditions => ["Lower(name) like ?", "%#{value.downcase}%"], 
													:per_page => per_page, 
													:page => page)
	end
	
	# Pesquisa por qualquer atributo presente no TouristSight
	#
	#		params:
	#			- {}: hash (Um hash que irá armazenar os seguintes atributos:
	#							:search => tourist_sight (chave que deverá armazenar um TouristSight para consulta),
	#							:per_page => 5 (Quantidade por página),
	#							:page => 1 (Página que deverá ser recuperada)
	#						)
	#
	def self.find_by_object(hash = nil)

		# Valores padrão
		condition = nil
		per_page = Config::PAGE_SIZE
		page = 1
		
		if hash
			# Valores padrao para o caso do hash não ser nulo
			per_page = hash.fetch(:per_page, Config::PAGE_SIZE).to_i
			page = hash.fetch(:page, 1).to_i
			search = hash.fetch(:search, nil)
			
			# Se o objeto tiver sido passado, prepara query
			if search
				
				attributes = []
				query = []
				
				# Cidade
				if search.city_id
					query << "city_id = ?"
					attributes << search.city_id
				end
				
				# Tags
				if search.tags and search.tags.length > 0
					use_tags = true
					
					query_with_or = "("
					
					search.tags.each do |tag|
						query_with_or << "tags.id = ? or "
						attributes << tag.id
					end
					
					# Retirando ultimo or adiciondo que sobrar
					query_with_or.strip!.gsub!(/or\Z/, '')
					# Fechando )
					query_with_or << ")"
					# Adicionando ao array de querys
					query << query_with_or
				end
				
				# User
				if search.user
					query << "user_id = ?"
					attributes << search.user_id
				end
				
				condition = ActiveRecordUtil.prepare_condition(query, attributes)
			end
			
		end
		
		# Montando parametros para consulta
		parameters = {}
		parameters[:per_page] = per_page
		parameters[:page] = page
		parameters[:order] = "hits desc"
		if condition
			parameters[:select] = "distinct tourist_sights.*"
			parameters[:conditions] = condition
		end
		if use_tags
			parameters[:joins] = :tags
		end
		
		# Executando consulta
		TouristSight.paginate(parameters)
		
	end
	
end













