# Region - Região
#
# Este modelo representa os em que os estados estão distribuídos.
# Ex: norte, nordestes, sudeste, sul, centro-oeste, etc.
#
# Atributos:
# 	Country: country (O país de origem desta região)
#   String: name (Nome da região)
#
class Region < ActiveRecord::Base
	belongs_to :country
end
