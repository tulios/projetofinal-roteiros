# Tourist Sight Tip - Dica de ponto turístico
#
# Este modelo representa as dicas de pontos turísticos. 
# É uma classe associativa entre Tip e TouristSight.
#
# Atributos:
#   TouristSight: tourist_sight (O ponto turístico o qual a dica pertence)
#
class TouristSightTip < Tip
  belongs_to :tourist_sight
end
