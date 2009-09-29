# RoadmapsController - Controlador de Roteiros
# 
# Este controlador é responsável por processar e 
# responder as requisições relativas aos roteiros. 
# 
class RoadmapsController < ApplicationController
	require_role "user", :for_all_except => :show

  # GET /roadmaps
  # GET /roadmaps.xml
  # 
	# Carrega a listagem de roteiros do usuário.
	#
  def index
    @roadmaps = Roadmap.paginate_by_user_id(
			current_user.id,
		  :per_page => Config::PAGE_SIZE, 
		  :page => params[:page], 
		  :order => "updated_at desc"
		)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @roadmaps }
    end
  end

  # GET /roadmaps/id
  # GET /roadmaps/id.xml
  # 
	# Exibe os dados do roteiro
	#
	# Params:
	#   - id (Id do roteiro)
	#
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
  # 
	# Carrega a tela para a criação de um novo roteiro.
	#
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

  # GET /roadmaps/id/edit
  # GET /roadmaps/id/edit.xml
  # 
	# Carrega a tela de edição do roteiro.
	#
	# Params:
	#   - id (Id do roteiro)
	#
  def edit
		@roadmap = Roadmap.find(params[:id])
                    
    if not validate_permission(@roadmap)
      return
    end

		if @roadmap.user.id != current_user.id and (not @roadmap.public)
			flash[:error] = "Esse roteiro não é público e não te pertence!"
			redirect_to roadmaps_path
		end

		@states = State.load_all
		@cities = City.load_all(@roadmap.city.state.id)
  end

  # POST /roadmaps
  # POST /roadmaps.xml
  # 
	# Cria um novo roteiro com os dados submetidos
	#
	# Params:
	#   - roadmap (Hash com os dados do roteiro)
	#
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

  # PUT /roadmaps/id
  # PUT /roadmaps/id.xml
  # 
	# Atualiza um roteiro com os dados submetidos.
	#
	# Params:
	#   - id (Id do roteiro)
	#   - roadmap (Hash com os dados do roteiro)
	#
  def update
    @roadmap = Roadmap.find(params[:id])
                         
    if not validate_permission(@roadmap)
      return
    end
         		    
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

  # DELETE /roadmaps/id
  # DELETE /roadmaps/id.xml
  # 
	# Exclui um roteiro
	#
	# Params:
	#   - id (Id do roteiro)
	#
  def destroy
    @roadmap = Roadmap.find(params[:id])
		                      
		if not validate_permission(@roadmap)
      return
    end

		@roadmap.destroy

		respond_to do |format|
		  format.html { redirect_to(roadmaps_url) }
		  format.xml  { head :ok }
		end

	end

end
