class SearchController < ApplicationController

	def index
		@value = params[:value]
		@shops = Shop.find_like_name(@value, 10, params[:page])
		@tourist_sights = TouristSight.find_like_name(@value, 10, params[:page])
		
		@results = ((@shops and @shops.length > 0) or (@tourist_sights and @tourist_sights.length > 0))
	end

end
