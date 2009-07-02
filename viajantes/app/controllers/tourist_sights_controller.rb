class TouristSightsController < ApplicationController
	
	# Utilizado para carregar as cidades de um determinado estado
	# Params:
	#  - state_id
	def cities
    load_cities(params[:state_id])

    respond_to do |format|
      format.js {render :layout => false} # cities.js.erb
    end
	end

  # GET /tourist_sights
  # GET /tourist_sights.xml
  def index
    @tourist_sights = TouristSight.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tourist_sights }
   end
  end

  # GET /tourist_sights/1
  # GET /tourist_sights/1.xml
  def show
    @tourist_sight = TouristSight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tourist_sight }
    end
  end

  # GET /tourist_sights/new
  # GET /tourist_sights/new.xml
  def new
    @tourist_sight = TouristSight.new
		load_states

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tourist_sight }
    end
  end

  # GET /tourist_sights/1/edit
  def edit
    @tourist_sight = TouristSight.find(params[:id])
		load_states
		load_cities(@tourist_sight.city.state.id)
  end

  # POST /tourist_sights
  # POST /tourist_sights.xml
  def create
    @tourist_sight = TouristSight.new(params[:tourist_sight])
		
    respond_to do |format|
      if @tourist_sight.save
        flash[:notice] = 'Ponto turístico criado com sucesso.'
        format.html { redirect_to(@tourist_sight) }
        format.xml  { render :xml => @tourist_sight, :status => :created, :location => @tourist_sight }
      else
			
				# Recarrega os estados e as cidades se possivel
				reload_states_and_citys

        format.html { render :action => "new" }
        format.xml  { render :xml => @tourist_sight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tourist_sights/1
  # PUT /tourist_sights/1.xml
  def update
    @tourist_sight = TouristSight.find(params[:id])

    respond_to do |format|
      if @tourist_sight.update_attributes(params[:tourist_sight])
        flash[:notice] = 'Ponto turístico atualizado com sucesso.'
        format.html { redirect_to(@tourist_sight) }
        format.xml  { head :ok }
      else

				# Recarrega os estados e as cidades se possivel
				reload_states_and_citys				
				
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tourist_sight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tourist_sights/1
  # DELETE /tourist_sights/1.xml
  def destroy
    @tourist_sight = TouristSight.find(params[:id])
    @tourist_sight.destroy

    respond_to do |format|
      format.html { redirect_to(tourist_sights_url) }
      format.xml  { head :ok }
    end
  end

	# == Metodos utilitarios ==
	private
	# Carrega os estados do Brasil (1)
	def load_states
		@states = State.find_all_by_country_id(1, :order => "name asc")
	end

	# Carrega as cidades pelo estado
	def load_cities(state_id)
		@cities = City.find_all_by_state_id(state_id, :order => "name asc")
	end
	
	# Recarrega os estados e as cidades se possivel
	def reload_states_and_citys
		# carrega novamente os estados para exibir no combo
		load_states
		# carrega novamente as cidades se o estado tiver sido informado
		if @tourist_sight and @tourist_sight.city
			load_cities(@tourist_sight.city.state.id)
		end
	end
end











