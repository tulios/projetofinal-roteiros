# DestinationsController - Controlador de Destinos
# 
# Este controlador é responsável por processar e 
# responder as requisições relativas aos destinos. 
# 
class DestinationsController < ApplicationController
	require_role "user", :for_all_except => :show

  # GET /roadmaps/roadmap_id/destinations/new
  # GET /roadmaps/roadmap_id/destinations/new.xml
  # 
	# Carrega o tela para criação de um novo destino.
	#
	# Params:
	#   - roadmap_id (Id do roteiro)
	#
  def new
    @destination = Destination.new
    @destination.roadmap = Roadmap.find(params[:roadmap_id])
    @roadmap = @destination.roadmap
    @destinations =  @roadmap.destinations
    @states = State.load_all
    @vehicles = Vehicle.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @destination }
    end
  end

  # GET /roadmaps/roadmap_id/destinations/id/edit
  # GET /roadmaps/roadmap_id/destinations/id/edit.xml
  # 
	# Carrega a tela de edição de um destino.
	#
	# Params:
	#   - roadmap_id (Id do roteiro)
	#   - id (Id do destino)
	#
  def edit
    @destination = Destination.find(params[:id])
    @roadmap = @destination.roadmap

    @destinations =  @roadmap.destinations
    @states = State.all
    @vehicles = Vehicle.all
    @cities = City.all
  end

  # POST /roadmaps/roadmap_id/destinations
  # POST /roadmaps/roadmap_id/destinations.xml
  # 
	# Cria um novo destino com os dados submetidos.
	#
	# Params:
	#   - roadmap_id (Id do roteiro)
	#   - destination (Hash com os dados do destino)
	#
  def create
    @destination = Destination.new(params[:destination])
    @roadmap = Roadmap.find(params[:roadmap_id])

    @destination.start_date = to_date(params[:destination][:start_date])
    @destination.end_date = to_date(params[:destination][:end_date])
    @destination.roadmap = @roadmap
		@destination.planned_cost = currency_to_number(params[:destination][:planned_cost])

    respond_to do |format|
      if @destination.save
        flash[:notice] = 'O destino foi criado com sucesso!'
        format.html { redirect_to(:controller => "roadmaps", 
											:action => "show", 
											:id => @destination.roadmap.id
										 ) }
        format.xml  { render :xml => @destination, :status => :created, :location => @destination }
      else
        # Recarrega os estados e cidades
        load_states_and_cities
        @roadmap = @destination.roadmap
        @destinations =@roadmap.destinations
        @vehicles = Vehicle.all
        @destinations =  @roadmap.destinations
      
        format.html { render :action => "new" }
        format.xml  { render :xml => @destination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /roadmaps/roadmap_id/destinations/id
  # PUT /roadmaps/roadmap_id/destinations/id.xml
  # 
	# Atualiza os dados de um destino com os dados submetidos.
	#
	# Params:
	#   - roadmap_id (Id do roteiro)
	#   - id (Id do destino)
	#   - destination (Hash com os dados do roteiro)
	#
  def update
    @destination = Destination.find(params[:id])
    @roadmap = @destination.roadmap

    params[:destination][:start_date] = to_date(params[:destination][:start_date])
    params[:destination][:end_date] = to_date(params[:destination][:end_date])
		params[:destination][:planned_cost] = currency_to_number(params[:destination][:planned_cost])

    respond_to do |format|
      if @destination.update_attributes(params[:destination])
        flash[:notice] = 'O destino foi atualizado com sucesso!'
        format.html { redirect_to(roadmap_path(@destination.roadmap)) }
        format.xml  { head :ok }
      else
        load_states_and_cities
        @vehicles = Vehicle.all
        @destinations =  @roadmap.destinations

        format.html { render :action => "edit" }
        format.xml  { render :xml => @destination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /roadmaps/roadmap_id/destinations/id
  # DELETE /roadmaps/roadmap_id/destinations/id.xml
  # 
	# Exclui um destino.
	#
	# Params:
	#   - roadmap_id (Id do roteiro)
	#   - id (Id do destino)
	#
  def destroy
    @destination = Destination.find(params[:id])
    @roadmap = @destination.roadmap
    @destination.destroy

    respond_to do |format|
      format.html { redirect_to(@roadmap) }
      format.xml  { head :ok }
    end
  end
  
  # Carrega os estados e as cidades se possivel
	def load_states_and_cities
		# carrega novamente os estados para exibir no combo
		@states = State.load_all
		# carrega novamente as cidades se o estado tiver sido informado
		if @destination and @destination.city
			@cities = City.load_all(@destination.city.state.id)
		end
	end
end
