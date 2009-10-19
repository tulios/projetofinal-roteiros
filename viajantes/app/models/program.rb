# Program - Programa
#
# Este modelo representa um programa planejado para ocorrer em 
# um destino (destination) de um roteiro de viagem (roadmap).
# Ex: Ir ao shopping, visitar a praia, ir ao museu, etc.
#
# Atributos:
# 	Destination: destination (Destino o qual o programa pertence)
# 	Date: date (Data em que o programa irá acontecer)
# 	Float: value (Custo deste programa)
# 	Text: description (Uma descrição sobre o que será feito)
# 	TouristSigh: tourist_sight (Possível ponto turístico que será visitado neste programa)
# 	Shop: shop (Possível estabelecimento que será visitado neste programa)
#
class Program < ActiveRecord::Base

	belongs_to :destination

  belongs_to :tourist_sight
  belongs_to :shop

	validates_format_of 	:date, :with =>  /\A\d{4}\-\d{2}\-\d{2}\Z/
	validates_presence_of :date, :value, :destination_id

	attr_accessor :happens_in
	
  # Variável de classe com as opções onde o programa pode acontecer
	#
	@@happens_in_options = {:tourist_sight => "Ponto Turístico",
													:shop => "Estabelecimento",
													:another => "Outro"}
                            
  # Realiza a validação da data de ocorrência do programa
  #                        
  def validate                             
    if date and destination and destination.start_date and destination.end_date
      
      # Menor que a data de início do destino
      if date < destination.start_date
        start_date = Converters::date_to_string(destination.start_date)
        errors.add(:date, "deve ser maior ou igual a data de início do destino (#{start_date}).")
        return
      end
    
      # Maior que a data de fim do destino
      if date > destination.end_date
        end_date = Converters::date_to_string(destination.end_date)
        errors.add(:date, "deve ser menor ou igual a data de fim do destino (#{end_date}).")
        return
      end
         
    end
  end                          

	# Retorna as opções de ocorrência possíveis para um programa (acontece em?).
	# Retorna os valores definidos no hash @@happens_in_options.
	#
	def self.happens_in_options
		@@happens_in_options
	end

	# Retorna a opção de ocorrência de um programa (acontece em?).
	# Caso nenhuma opção tenha sido escolhida o valor :another será
	# retornado.
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
	
end
















