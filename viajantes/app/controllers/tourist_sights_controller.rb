class TouristSightsController < ApplicationController
	require_role "user", :for_all_except => [:index, :show]

  # GET /tourist_sights
  # GET /tourist_sights.xml
  def index
    @tourist_sights = TouristSight.paginate(:per_page => 10, :page => params[:page], :order => "hits desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tourist_sights }
  	end
  end

  # GET /tourist_sights/1
  # GET /tourist_sights/1.xml
  def show
    @tourist_sight = TouristSight.find(params[:id])
		@city = @tourist_sight.city
		@tips = @tourist_sight.tips(params[:page])
		@tourist_sight.increase_hits
		
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tourist_sight }
    end
  end

  # GET /tourist_sights/new
  # GET /tourist_sights/new.xml
  def new
    @tourist_sight = TouristSight.new
		@states = State.load_all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tourist_sight }
    end
  end

  # GET /tourist_sights/1/edit
  def edit
    @tourist_sight = TouristSight.find(params[:id])
		@states = State.load_all
		@cities = City.load_all(@tourist_sight.city.state.id)
  end

  # POST /tourist_sights
  # POST /tourist_sights.xml
  def create
    @tourist_sight = TouristSight.new(params[:tourist_sight])
    @tourist_sight.user_id = current_user.id
		
		# Permite emails nulos, se a pessoa nao preencher eh nulo
		if @tourist_sight.email and @tourist_sight.email.length == 0
			@tourist_sight.email = nil
		end
		
    respond_to do |format|
      if @tourist_sight.save
        flash[:notice] = 'Ponto turístico criado com sucesso.'
        format.html { redirect_to(@tourist_sight) }
        format.xml  { render :xml => @tourist_sight, :status => :created, :location => @tourist_sight }
      else
			
				# Recarrega os estados e as cidades se possivel
				load_states_and_cities

        format.html { render :action => "new" }
        format.xml  { render :xml => @tourist_sight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tourist_sights/1
  # PUT /tourist_sights/1.xml
  def update
    @tourist_sight = TouristSight.find(params[:id])

		# Permite emails nulos, se a pessoa nao preencher eh nulo
		if @tourist_sight.email and @tourist_sight.email.length == 0
			@tourist_sight.email = nil
		end

    respond_to do |format|
      if @tourist_sight.update_attributes(params[:tourist_sight])
        flash[:notice] = 'Ponto turístico atualizado com sucesso.'
        format.html { redirect_to(@tourist_sight) }
        format.xml  { head :ok }
      else

				# Recarrega os estados e as cidades se possivel
				load_states_and_cities				
				
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

	# Carrega os estados e as cidades se possivel
	def load_states_and_cities
		# carrega novamente os estados para exibir no combo
		@states = State.load_all
		# carrega novamente as cidades se o estado tiver sido informado
		if @tourist_sight and @tourist_sight.city
			@cities = City.load_all(@tourist_sight.city.state.id)
		end
	end
end











