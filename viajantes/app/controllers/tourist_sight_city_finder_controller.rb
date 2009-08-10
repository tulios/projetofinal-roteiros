class TouristSightCityFinderController < ApplicationController

	def index
		@tourist_sights = TouristSight.find_all_by_city_id(params[:city_id], :order => "name asc")
		respond_to do |format|
      format.html { render :layout => false } # index.html.erb
    end
	end

end
