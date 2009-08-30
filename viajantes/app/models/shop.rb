# Shop - Estabelecimento
#
# Este modelo representa um estabelecimento comercial.
# Ex: restaurantes, hotéis, clubes, etc.
#
# Atributos:
# 	String: name (O nome do estabelecimento)
# 	String: address (endereço)
# 	String: phone (telefone)
# 	String: description (A descrição do estabelecimento)
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
  
  has_many :shop_evaluations, :order => "created_at desc", :limit => 5
  has_many :evaluations, :through => :shop_evaluations

	validates_presence_of :city_id, :name, :address

	# Aumenta o número de acessos em 1.
	#
  def increase_hits
	  self.update_attributes(:hits => self.hits + 1)
	end

	# Recupera todos os estabelecimentos com o nome ou as palavras-chave parecidas com o valor informado.
	#
	# params:
	#		- String: value (O valor pesquisado)
	# 	- Integer: per_page (O tamanho máximo da página retornada)
	#		- Integer: page (O número da página retornada)
	#
	def self.find_like_name_or_key_word(value, per_page = 10, page = 1)
		cond = ["Lower(name) like ? or Lower(key_words) like ?", "%#{value.downcase}%", "%#{value.downcase}%"]
		Shop.paginate(:conditions => cond, 
									:per_page => per_page, 
									:page => page)
	end
end
