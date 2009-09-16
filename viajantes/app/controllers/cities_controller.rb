# CitiesController - Controlador de Cidades
# 
# Este controlador é responsável por processar e 
# responder as requisições relativas às cidades. 
#  
class CitiesController < ApplicationController

  # GET /cities
  # 
	# Carrega todas as cidades de um determinado estado
	#
	# Params:
	#   - state_id (Id do estado)
	#
	def index
    @cities = City.load_all(params[:state_id])
		respond_to do |format|
      format.html { render :layout => false } # index.html.erb
    end
	end

end
