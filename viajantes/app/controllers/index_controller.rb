class IndexController < ApplicationController
	
	def index

		@shops = Shop.paginate(:per_page => 5, :page => 1, :order => "hits desc")
		@tourist_sights = TouristSight.paginate(:per_page => 5, :page => 1, :order => "hits desc")

		# Pagina inicial do usuario
		if logged_in?
			
		else # Pagina inicial da aplicacao
		
		end
	end

end
