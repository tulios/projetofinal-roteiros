class TouristSightTagsController < ApplicationController

	def new
		@tourist_sight = TouristSight.find(params[:tourist_sight_id])
		@tags = Tag.all
	end

	def create
		tag_ids = params[:tag][:id]
		tourist_sight_id = params[:tourist_sight_id]
		@tourist_sight = TouristSight.find(tourist_sight_id)

		new_tags = []
		tag_ids.each do |id|
			new_tags << Tag.find(id)
		end

		if @tourist_sight.save_tags(new_tags)
			flash[:notice] = 'Tags adicionadas com sucesso.'
		else
			flash[:error] = 'Falha ao adicionar tags!'
		end

		respond_to do |format|
	    format.html { redirect_to(@tourist_sight) }
		end
	end
	
end
