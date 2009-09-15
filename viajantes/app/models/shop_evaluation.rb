# ShopEvaluation - Avaliação de Estabelecimento
# 
# Este modelo representa as avaliações de estabelecimentos.
# 
# Atributos:
#    Shop: shop (O estabelecimento o qual a avaliação pertence)
#    Evaluation: evaluation (A avaliação do estabelecimento)
#    
class ShopEvaluation < ActiveRecord::Base
  belongs_to :shop
  belongs_to :evaluation, :dependent => :destroy
end
