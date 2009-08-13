class SearchController < ApplicationController

	def index
		# Valor pesquisado pelo usuario
		@value = params[:value]

		# Consultas
		@shops = Shop.find_like_name_or_key_word(@value, 10, params[:page_shop])
		@tourist_sights = TouristSight.find_like_name(@value, 10, params[:page_ts])
		@roadmaps = Roadmap.find_like_title(@value, 10, params[:page_rm])		

		# Veriavel que determina se houve resultados
		@results = (
			(@shops and @shops.length > 0) or 
			(@tourist_sights and @tourist_sights.length > 0) or
			(@roadmaps and @roadmaps.length > 0)
		)

		# Aba que deve ficar selecionada
		if params[:selected]
			@selected = params[:selected]
		end
	end

end
