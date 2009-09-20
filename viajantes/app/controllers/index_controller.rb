class IndexController < ApplicationController
	
	def index
	  # Mais vizualizados
		@most_viewed_shops = Shop.paginate(:per_page => Config::PAGE_SIZE, 
																		 	 :page => 1, 
																		 	 :order => "hits desc")
																		 	 
		@most_viewed_tourist_sights = TouristSight.paginate(:per_page => Config::PAGE_SIZE, 
																											  :page => 1, 
																											  :order => "hits desc")
		
		# Últimos Adicionados 
		@last_added_shops = Shop.paginate(:per_page => Config::PAGE_SIZE, 
																			:page => 1, 
																			:order => "created_at desc")
																			
		@last_added_tourist_sights = TouristSight.paginate(:per_page => Config::PAGE_SIZE,
																											 :page => 1, 
																											 :order => "created_at desc")
																											 
		@last_added_events = Event.paginate(:per_page => Config::PAGE_SIZE, 
																			  :page => 1, 
																			  :order => "created_at desc")
		
		@roadmaps = Roadmap.paginate_all_by_public(true, 
																							 :per_page => Config::PAGE_SIZE,
																						   :page => 1, 
																						   :order => "created_at desc")

		# Pagina inicial do usuario
		if logged_in?
			
		else # Pagina inicial da aplicacao
		
		end
	end

end
