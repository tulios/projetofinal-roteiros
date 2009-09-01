class ShopEvaluation < ActiveRecord::Base
	# Shop: shop
	# Evaluation: evaluation

  belongs_to :shop
  belongs_to :evaluation
end
