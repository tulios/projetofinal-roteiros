class RoadmapsController < ApplicationController
	require_role "user", :for_all_except => :show

  # GET /roadmaps
  # GET /roadmaps.xml
  def index
    @roadmaps = Roadmap.paginate_by_user_id(
			current_user.id,
		 :per_page => 10, :page => params[:page], :order => "updated_at desc"
		)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @roadmaps }
    end
  end

  # GET /roadmaps/1
  # GET /roadmaps/1.xml
  def show
    @roadmap = Roadmap.find(params[:id])
    @destinations = @roadmap.destinations

		if logged_in? and @roadmap.user.id != current_user.id and (not @roadmap.public)
			flash[:error] = "Esse roteiro não é público e não te pertence!"
			redirect_to roadmaps_path

		else
			@city = @roadmap.city

		  respond_to do |format|
		    format.html # show.html.erb
		    format.xml  { render :xml => @roadmap }
		  end

		end
  end

  # GET /roadmaps/new
  # GET /roadmaps/new.xml
  def new
    @roadmap = Roadmap.new
		# Inicializa o ponto de partida com a cidade natal do usuario
		@roadmap.city = current_user.city
	
		@states = State.load_all
		# Ja carrega todas as cidades do estado natal do usuario
		@cities = City.load_all(current_user.city.state.id)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @roadmap }
    end
  end

  # GET /roadmaps/1/edit
  def edit
		@roadmap = Roadmap.find(params[:id])

		if @roadmap.user.id != current_user.id and (not @roadmap.public)
			flash[:error] = "Esse roteiro não é público e não te pertence!"
			redirect_to roadmaps_path
		end

		@states = State.load_all
		@cities = City.load_all(@roadmap.city.state.id)
  end

  # POST /roadmaps
  # POST /roadmaps.xml
  def create
    @roadmap = Roadmap.new(params[:roadmap])
		@roadmap.user_id = current_user.id

    respond_to do |format|
      if @roadmap.save
        flash[:notice] = 'Roteiro criado com sucesso.'
        format.html { redirect_to(@roadmap) }
        format.xml  { render :xml => @roadmap, :status => :created, :location => @roadmap }
      else
			
				# Recarrega os estados e as cidades se possivel
				load_states_and_cities(@roadmap)

        format.html { render :action => "new" }
        format.xml  { render :xml => @roadmap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /roadmaps/1
  # PUT /roadmaps/1.xml
  def update
    @roadmap = Roadmap.find(params[:id])

		if @roadmap.user.id != current_user.id and (not @roadmap.public)
			flash[:error] = "Esse roteiro não é público e não te pertence!"
			redirect_to roadmaps_path
		else

		  respond_to do |format|
		    if @roadmap.update_attributes(params[:roadmap])
		      flash[:notice] = 'Roteiro atualizado com sucesso.'
		      format.html { redirect_to(@roadmap) }
		      format.xml  { head :ok }
		    else

					# Recarrega os estados e as cidades se possivel
					load_states_and_cities(@roadmap)

		      format.html { render :action => "edit" }
		      format.xml  { render :xml => @roadmap.errors, :status => :unprocessable_entity }
		    end
		  end

		end
  end

  # DELETE /roadmaps/1
  # DELETE /roadmaps/1.xml
  def destroy
    @roadmap = Roadmap.find(params[:id])
		
		if @roadmap.user.id != current_user.id and (not @roadmap.public)
			flash[:error] = "Esse roteiro não é público e não te pertence!"
			redirect_to roadmaps_path
		else

		  @roadmap.destroy

		  respond_to do |format|
		    format.html { redirect_to(roadmaps_url) }
		    format.xml  { head :ok }
		  end

		end
  end

end
