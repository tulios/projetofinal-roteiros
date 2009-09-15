# Tag - Etiqueta
# 
# Este modelo representa as tags que podem ser atribuídas a objetos.
# A tag tem o intúito de ajudar na classificação dos objetos.
# 
# Atributos:
#    - String: name (Nome da tag)
# 
class Tag < ActiveRecord::Base
	validates_presence_of :name
	validates_uniqueness_of :name
	validates_length_of :name, :in => 4..15
end
