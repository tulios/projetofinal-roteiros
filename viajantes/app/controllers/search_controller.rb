class SearchController < ApplicationController

	def index
		@value = params[:value]
		@shops = Shop.find_like_name_or_key_word(@value, 10, params[:page_shop])
		@tourist_sights = TouristSight.find_like_name(@value, 10, params[:page_ts])
		
		@results = ((@shops and @shops.length > 0) or (@tourist_sights and @tourist_sights.length > 0))
		if params[:selected]
			@selected = params[:selected]
		end
	end

end
