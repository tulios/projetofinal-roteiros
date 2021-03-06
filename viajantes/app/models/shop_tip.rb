# Shop Tip - Dica de Estabelecimento
#
# Este modelo representa as dicas de estabelecimentos. 
# É uma classe associativa entre Shop e Tip.
#
# Atributos:
#   Shop: shop (O ponto turístico o qual a dica pertence)
#   Tip: tip (A dica do estabelecimento)
#
class ShopTip < ActiveRecord::Base
  belongs_to :shop
  belongs_to :tip, :dependent => :destroy
  
  validates_presence_of :shop, :tip
end
