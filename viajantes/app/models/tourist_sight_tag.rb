# TouristSightTag - Tag (Etiqueta) de Ponto Turístico
# 
# Este modelo representa as tags de pontos turísticos
# É uma classe associativa entre TouristSight e Tag
# 
# Atributos:
#   TouristSight: tourist_sight (O ponto turístico o qual a tag pertence)
#   Tag: tag (A tag do ponto turístico)
#    
class TouristSightTag < ActiveRecord::Base
	belongs_to :tourist_sight
  belongs_to :tag
  
  validates_associated :tourist_sight
  validates_associated :tag
end
