class TouristSightTagsController < ApplicationController
	require_role "user", :for_all_except => :index

  # Lista todos os TouristSights que estao na cidade informada e possuem a tag
  # informada.
  #
  # Parametros necessarios:
  # - city_id
  # - tag_id
  def index
		tourist_sight = TouristSight.find(params[:tourist_sight_id])

		@city = tourist_sight.city
		@tag = Tag.find(params[:tag_id])
		@tourist_sights = TouristSight.find_all_by_city_and_tag(@city.id, @tag.id, 10, params[:page])
		# index.html.erb
  end
	
	# Lista todos os TouristSights que estao na cidade informada e possuem a tag
	# informada.
	#
	# Parametros necessarios:
	# 	- city_id
	#		- tag_id
	# Parametros necessarios:
	#		- tourist_sight_id
	
	def new
		@tourist_sight = TouristSight.find(params[:tourist_sight_id])
		@city = @tourist_sight.city
		@tags = Tag.all
		# new.html.erb
	end
	
	# Parametros necessarios:
	# 	- tag_id
	#		- tourist_sight_id
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
	    format.html { redirect_to(@tourist_sight) } # tourist_sights/show.html.erb
		end
	end
	
end
