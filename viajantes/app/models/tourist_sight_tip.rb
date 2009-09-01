# Tourist Sight Tip - Dica de ponto turístico
#
# Este modelo representa as dicas de pontos turísticos. 
# É uma classe associativa entre Tip e TouristSight.
#
# Atributos:
#   TouristSight: tourist_sight (O ponto turístico o qual a dica pertence)
#   Tip: tip (A dica do ponto turístico)
#
class TouristSightTip < ActiveRecord::Base
  # TouristSight: tourist_sight
  # Tip: tip
  
  belongs_to :tourist_sight
  belongs_to :tip, :dependent => :destroy
  
end
