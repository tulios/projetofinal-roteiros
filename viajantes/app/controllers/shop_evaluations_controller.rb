class ShopEvaluationsController < ApplicationController
	require_role "user", :for_all_except => :show
	
	def show
		@shop = Shop.find(params[:shop_id])
		@city = @shop.city
		@shop_evaluation = ShopEvaluation.find(params[:id])
		@evaluation = @shop_evaluation.evaluation
	end
	
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
		     
		already_evaluated = @shop.already_evaluated?(current_user)
		
		respond_to do |format|
			# Salvando
			if (not already_evaluated) and @evaluation.save
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
			  if already_evaluated
			    flash[:error] = 'Este estabelecimento já foi avaliado essa semana.'
		    end
				@city = @shop.city
				format.html { render :action => "new" }
			end
			
	    format.html { redirect_to(@shop) }
		end
	end

	def destroy
		@shop_evaluation = ShopEvaluation.find(params[:id])
		shop = @shop_evaluation.shop
		@shop_evaluation.destroy
	
    respond_to do |format|
      format.html { 
				redirect_to(:controller => :shops, :action => :show, :id => shop.id)
			}
      format.xml  { head :ok }
    end
  end

end
