class SearchController < ApplicationController

	def index
	  @states = State.load_all
	  
		# Valor pesquisado pelo usuario
		@value = params[:value]

    # Caso tenha usado a pesquisa, seleciona pela cidade
    if params[:state_id] and params[:state_id].length > 0 and 
       params[:city_id] and params[:city_id].length > 0
      
      @state_id = Integer(params[:state_id])
      @city_id = Integer(params[:city_id])
      @cities = City.load_all(@state_id)
      
      @shops = Shop.find_like_name_or_key_word(@value, Config::PAGE_SIZE, params[:page_shop], @city_id)
      @tourist_sights = TouristSight.find_like_name(@value, Config::PAGE_SIZE, params[:page_ts], @city_id)
      @roadmaps = Roadmap.find_like_title(@value, Config::PAGE_SIZE, params[:page_rm], @city_id)
      @events = Event.find_like_name(@value, Config::PAGE_SIZE, params[:page_event], @city_id)
      
      @advance_search = true
    else    
      # Consultas
      @shops = Shop.find_like_name_or_key_word(@value, Config::PAGE_SIZE, params[:page_shop])
      @tourist_sights = TouristSight.find_like_name(@value, Config::PAGE_SIZE, params[:page_ts])
      @roadmaps = Roadmap.find_like_title(@value, Config::PAGE_SIZE, params[:page_rm])	
      @events = Event.find_like_name(@value, Config::PAGE_SIZE, params[:page_event])	
    end

		# Variavel que determina se houve resultados
		@results = (
			(@shops and @shops.length > 0) or 
			(@tourist_sights and @tourist_sights.length > 0) or
			(@roadmaps and @roadmaps.length > 0) or
 			(@events and @events.length > 0)			
		)

		# Aba que deve ficar selecionada
		if params[:selected]
			@selected = params[:selected]
		end
	end

end
