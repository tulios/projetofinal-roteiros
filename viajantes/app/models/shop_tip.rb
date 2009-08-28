# Shop Tip - Dica de estabelecimento
#
# Este modelo representa as dicas de estabelecimentos. 
# É uma classe associativa entre Tip e Shop.
#
# Atributos:
#   Shop: shop (O estabelecimento o qual a dica pertence)
#
class ShopTip < Tip
  belongs_to :shop
end
