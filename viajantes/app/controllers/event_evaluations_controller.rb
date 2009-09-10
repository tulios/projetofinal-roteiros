class EventEvaluationsController < ApplicationController
	require_role "user", :for_all_except => :show
	
	def show
		@event = Event.find(params[:event_id])
		@city = @event.city
		@event_evaluation = EventEvaluation.find(params[:id])
		@evaluation = @event_evaluation.evaluation
	end
	
	def new
		@event = Event.find(params[:event_id])
		@city = @event.city
		
		@event_evaluation = EventEvaluation.new
		@event_evaluation.evaluation = Evaluation.new
		@event_evaluation.event = @event
	end

	def create
		@event = Event.find(params[:event_id])
		@event_evaluation = EventEvaluation.new
		@event_evaluation.event = @event
		
		# Populando objeto de avaliação
		@evaluation = Evaluation.new(params[:evaluation])
		@evaluation.fill_rates(params)
		
		@event_evaluation.evaluation = @evaluation
		@evaluation.city = @event.city
		@evaluation.user = current_user
		
		respond_to do |format|
			# Salvando
			if @evaluation.save
				# Salvando relação
				if @event_evaluation.save
					flash[:notice] = 'Evento avaliado com sucesso.'
				else
					# Caso falhe, apaga a avaliação criada
					@city = @event.city
					@evaluation.destroy
					format.html { render :action => "new" }
				end
				
			else
				@city = @event.city
				format.html { render :action => "new" }
			end
			
	    format.html { redirect_to(@event) }
		end
	end

	def destroy
		@event_evaluation = EventEvaluation.find(params[:id])
		event = @event_evaluation.event
		@event_evaluation.destroy
	
    respond_to do |format|
      format.html { 
				redirect_to(:controller => :events, :action => :show, :id => event.id)
			}
      format.xml  { head :ok }
    end
  end
  
end
