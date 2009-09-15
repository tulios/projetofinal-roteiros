# Tip - Dica
# 
# Este modelo representa as dicas.
# 
# Atributos:
#   String: name (Nome da dica)
#   Text: description (Descrição da dica)
#   User: user (Usuário o qual a dica pertence)
#    
class Tip < ActiveRecord::Base	
	belongs_to :user
	validates_presence_of :name, :description, :user
	validates_length_of :name, :in => 5..50 
	
	# Método acessor para o atributo virtual "especified_type"
  #
	def especified_type
  	Integer(read_attribute('especified_type'))
  end
end
