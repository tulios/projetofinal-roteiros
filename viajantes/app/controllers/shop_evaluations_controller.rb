class ShopEvaluationsController < ApplicationController
	
	def new
		@shop = Shop.find(params[:shop_id])
		@city = @shop.city
		
		@shop_evaluation = ShopEvaluation.new
		@shop_evaluation.evaluation = Evaluation.new
		@shop_evaluation.shop = @shop
	end

	def create
		@shop = Shop.find(params[:shop_id])
		@shop_evaluation = ShopEvaluation.new
		@shop_evaluation.shop = @shop
		
		# Populando objeto de avaliação
		@evaluation = Evaluation.new(params[:evaluation])
		@evaluation.fill_rates(params)
		
		@shop_evaluation.evaluation = @evaluation
		@evaluation.city = @shop.city
		@evaluation.user = current_user
		
		respond_to do |format|
			# Salvando
			if @evaluation.save
				# Salvando relação
				if @shop_evaluation.save
					flash[:notice] = 'Estabelecimento avaliado com sucesso.'
				else
					# Caso falhe, apaga a avaliação criada
					@city = @shop.city
					@evaluation.destroy
					format.html { render :action => "new" }
				end
				
			else
				#@shop_evaluation.evaluation = Evaluation.new
				@city = @shop.city
				format.html { render :action => "new" }
			end
			
	    format.html { redirect_to(@shop) }
		end
	end

end
