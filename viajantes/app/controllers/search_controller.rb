# SearchController - Controlador de busca
# 
# Este controlador é responsável por processar e  responder as 
# requisições relativas as buscas gerais do sistema. 
# 
class SearchController < ApplicationController

  # GET /search
  # GET /search.xml
  # 
	# Realiza uma pesquisa no sistema pelos estabelecimentos, pontos turísticos,
	# roteiros e eventos.
	#
	# Params:
	#   - value (valor a ser pesquisado)
	#   - state_id (Id do estado)
	#   - city_id (Id da cidade)
	#   - start (Data de inicio)
	#   - end (Data final)
	#   - page_shop (pagina da listagem de estabelecimentos)
	#   - page_ts (pagina da listagem de pontos turísticos)
	#   - page_rm (pagina da listagem de roteiros)
	#   - page_event (pagina da listagem de eventos)	
	#   - selected (numero da aba selecionada)
	#
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
			
		else               
		   # Caso não tenha nada selecionado, escolhe o primeiro na ordem que tiver
		   # resultado.
		   if @tourist_sights and @tourist_sights.length > 0
		     @selected = '0'
		   elsif @shops and @shops.length > 0
		     @selected = '1'
		   elsif @roadmaps and @roadmaps.length > 0
		     @selected = '2'
		   elsif @events and @events.length > 0
		     @selected = '3'
		   end  
		   
		end   
		
	end

end
