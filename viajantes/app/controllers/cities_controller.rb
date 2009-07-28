class CitiesController < ApplicationController

	# Utilizado para carregar as cidades de um determinado estado
	# Params:
	#  - state_id
	def index
    @cities = City.load_all(params[:state_id])
		respond_to do |format|
      format.html { render :layout => false } # index.html.erb
    end
	end

end
