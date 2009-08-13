class DestinationsController < ApplicationController
  # GET /destinations
  # GET /destinations.xml
  def index
    @roadmap = Roadmap.find(params[:roadmap_id])
    @destinations = Destination.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @destinations }
    end
  end

  # GET /destinations/1
  # GET /destinations/1.xml
  def show
    @destination = Destination.find(params[:id])
    @city = @destination.city

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @destination }
    end
  end

  # GET /destinations/new
  # GET /destinations/new.xml
  def new
    @destination = Destination.new
    @destination.roadmap = Roadmap.find(params[:roadmap_id])
    @states = State.load_all
    @vehicles = Vehicle.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @destination }
    end
  end

  # GET /destinations/1/edit
  def edit
    @destination = Destination.find(params[:id])
    @states = State.all
    @vehicles = Vehicle.all
    @cities = City.all
    
  end

  # POST /destinations
  # POST /destinations.xml
  def create
    @destination = Destination.new(params[:destination])
    @destination.roadmap = Roadmap.find(params[:roadmap_id])
    

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
        @vehicles = Vehicle.all
      
        format.html { render :action => "new" }
        format.xml  { render :xml => @destination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /destinations/1
  # PUT /destinations/1.xml
  def update
    @destination = Destination.find(params[:id])

    respond_to do |format|
      if @destination.update_attributes(params[:destination])
        flash[:notice] = 'Destination was successfully updated.'
        format.html { redirect_to(roadmap_destination_path(@destination.roadmap, @destination)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @destination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /destinations/1
  # DELETE /destinations/1.xml
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
