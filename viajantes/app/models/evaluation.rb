# Evaluation - Avaliacao
#
# Este modelo representa as avaliações atribuidas a algum assunto 
# Esta por sua vez é composta por uma crítica e uma nota para cada critério.
#  
# Atributos:
#   Text: criticism (Crítica da avaliação) 
#   Integer: general (Nota geral da avaliação)
#   Integer: service (Nota para o critério servico)
#   Integer: clean (Nota para o critério limpeza)
#   Integer: location (Nota para o critério localização)
#   Integer: price (Nota para o critério preço)
#   Integer: infraestrutura (Nota para o critério infraestrutura)
#   Integer: attendance (Nota para o críterio atendimento)
#   City: cidade (Cidade)
#   User: user (Usuário a qual a crítica pertence)
#
class Evaluation < ActiveRecord::Base
	
	belongs_to :user
  belongs_to :city
  
  # Variável de classe que é uma lista com os critérios de avaliação
  #
  @@rates = [:general, :service, :clean, :location, :price, :infrastructure, :attendance]
  
	validates_presence_of :user_id, :city_id, :criticism
  
  # Método acessor para a váriavel de classe @@rates
  #
  def self.rates
  	@@rates
  end
  
  # Itera os critérios de pesquisa. Para cada um, se tiver um valor 
  # válido no hash passado por parâmetro, atribui este valor 
  # ao atributo correspondente.
  #
  # params:
  #   - Hash: hash (Hash contendo as notas a serem atribuidas)
  #  
  def fill_rates(hash)
  	Evaluation.rates.each do |rate|
  		if hash[rate] and hash[rate].length > 0
  			self[rate] = hash[rate].to_i
  		end
  	end
  end
  
  # Método acessor para o atributo virtual "especified_type"
  #
  def especified_type
  	Integer(read_attribute('especified_type'))
  end
end
