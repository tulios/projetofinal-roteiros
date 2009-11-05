class TouristSightEvaluationsController < ApplicationController
	require_role "user", :for_all_except => :show
	
	def show
		@tourist_sight = TouristSight.find(params[:tourist_sight_id])
		@city = @tourist_sight.city
		@tourist_sight_evaluation = TouristSightEvaluation.find(params[:id])
		@evaluation = @tourist_sight_evaluation.evaluation
	end
	
	def new
		@tourist_sight = TouristSight.find(params[:tourist_sight_id])
		@city = @tourist_sight.city
		
		@tourist_sight_evaluation = TouristSightEvaluation.new
		@tourist_sight_evaluation.evaluation = Evaluation.new
		@tourist_sight_evaluation.tourist_sight = @tourist_sight
	end
	
	def create
		@tourist_sight = TouristSight.find(params[:tourist_sight_id])
		@tourist_sight_evaluation = TouristSightEvaluation.new
		@tourist_sight_evaluation.tourist_sight = @tourist_sight
		
		# Populando objeto de avaliação
		@evaluation = Evaluation.new(params[:evaluation])
		@evaluation.fill_rates(params)
		
		@tourist_sight_evaluation.evaluation = @evaluation
		@evaluation.city = @tourist_sight.city
		@evaluation.user = current_user
		
		respond_to do |format|
			# Salvando
			if @evaluation.save
				# Salvando relação
				if @tourist_sight_evaluation.save
					flash[:notice] = 'Ponto Turístico avaliado com sucesso.'
				else
					# Caso falhe, apaga a avaliação criada
					@city = @tourist_sight.city
					@evaluation.destroy
					format.html { render :action => "new" }
				end
				
			else
				@city = @tourist_sight.city
				format.html { render :action => "new" }
			end
			
	    format.html { redirect_to(@tourist_sight) }
		end
	end

	def destroy
		@tourist_sight_evaluation = TouristSightEvaluation.find(params[:id])
		tourist_sight = @tourist_sight_evaluation.tourist_sight
		@tourist_sight_evaluation.destroy
	
    respond_to do |format|
      format.html { 
				redirect_to(:controller => :tourist_sights, :action => :show, :id => tourist_sight.id)
			}
      format.xml  { head :ok }
    end
  end

end
