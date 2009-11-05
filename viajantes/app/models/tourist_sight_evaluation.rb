# TouristSightEvaluation - Avaliação de Ponto Turístico
# 
# Este modelo representa as avaliações de pontos turísticos.
# É uma classe associativa entre TouristSight e Evaluation
# 
# Atributos:
#   TouristSight: tourist_sight (O ponto turístico o qual a avaliação pertence)
#   Evaluation: evaluation (A avaliação do ponto turístico)
# 
class TouristSightEvaluation < ActiveRecord::Base
  belongs_to :tourist_sight
  belongs_to :evaluation, :dependent => :destroy
end
