class TouristSightsController < ApplicationController
	require_role "user", :for_all_except => [:index, :show]

  # GET /tourist_sights
  # GET /tourist_sights.xml
  def index
    @states = State.load_all
    @tags = Tag.all
    
    # Caso tenha usado a pesquisa, seleciona pela cidade
    if has_city? or has?(params[:tag_id])
      
      att = {}
      
      if has_city?
		    @state_id = Integer(params[:state_id])
		    @city_id = Integer(params[:city_id])
		    @cities = City.load_all(@state_id)
		    
		    att[:city_id] = @city_id
      end
      
      if has?(params[:tag_id])
      	@tag_id = Integer(params[:tag_id])
      	array = []
      	array << Tag.find(@tag_id)
      	
      	att[:tags] = array
      end
      
      search = TouristSight.new(att)
      
      @tourist_sights = TouristSight.find_by_object(:search => search,
      																							:per_page => Config::PAGE_SIZE, 
                                                    :page => params[:page])
      
      #@tourist_sights = TouristSight.paginate(:conditions => ["city_id = ?", @city_id],
      #                                        :per_page => Config::PAGE_SIZE, 
      #                                        :page => params[:page], :order => "hits desc")
    else
    # Caso contrario pega todas
      @tourist_sights = TouristSight.paginate(:per_page => Config::PAGE_SIZE, 
      																			  :page => params[:page], :order => "hits desc")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tourist_sights }
  	end
  end

  # GET /tourist_sights/1
  # GET /tourist_sights/1.xml
  def show
    @tourist_sight = TouristSight.find(params[:id])
    @evaluations = @tourist_sight.evaluations(params[:page])
    @average = @tourist_sight.evaluation_average
		@city = @tourist_sight.city
		@tips = @tourist_sight.tips(params[:page_tips])
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

    if not validate_permission(@tourist_sight)
      return
    end
    
		@states = State.load_all
		@cities = City.load_all(@tourist_sight.city.state.id)
  end

  # POST /tourist_sights
  # POST /tourist_sights.xml
  def create
  	# Caso não tenha sido preenchido seta nil para que o allow_nil deixe
		# de validar o formato desse email. (Conferir em app/models/tourist_sight.rb)
		if params[:tourist_sight][:email] and params[:tourist_sight][:email].strip.length == 0
			params[:tourist_sight][:email] = nil
		end
		
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
				load_states_and_cities(@tourist_sight)

        format.html { render :action => "new" }
        format.xml  { render :xml => @tourist_sight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tourist_sights/1
  # PUT /tourist_sights/1.xml
  def update
    @tourist_sight = TouristSight.find(params[:id])

		# Caso não tenha sido preenchido seta nil para que o allow_nil deixe
		# de validar o formato desse email. (Conferir em app/models/tourist_sight.rb)
		if params[:tourist_sight][:email] and params[:tourist_sight][:email].strip.length == 0
			params[:tourist_sight][:email] = nil
		end                            
		
		if not validate_permission(@tourist_sight)
      return
    end

    respond_to do |format|
      if @tourist_sight.update_attributes(params[:tourist_sight])
        flash[:notice] = 'Ponto turístico atualizado com sucesso.'
        format.html { redirect_to(@tourist_sight) }
        format.xml  { head :ok }
      else

				# Recarrega os estados e as cidades se possivel
				load_states_and_cities(@tourist_sight)
				
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tourist_sight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tourist_sights/1
  # DELETE /tourist_sights/1.xml
  def destroy
    @tourist_sight = TouristSight.find(params[:id])  
    
    if not validate_permission(@tourist_sight)
      return
    end
    
    if (@tourist_sight.tips and @tourist_sight.tips.length > 0) or 
       (@tourist_sight.evaluations and @tourist_sight.evaluations.length > 0) or
       (@tourist_sight.has_programs_associated?)
        
      flash[:error] = 'Este ponto turístico ainda possui avaliações, dicas ou está associado a um programa, apague-os antes de tentar excluir.'
      respond_to do |format|
          format.html { redirect_to @tourist_sight }
      end             
      return
    end
    
    @tourist_sight.destroy

    respond_to do |format|
      format.html { redirect_to(tourist_sights_url) }
      format.xml  { head :ok }
    end
  end
	
	private
	
	# Retorna true se os valores de state_id 
  # e city_id tiverem sido submetidos
  #
  def has_city?
  	has?(params[:state_id]) and has?(params[:city_id])
  end
  
  # Retorna true caso o param seja diferente de nil 
  # e seu comprimento for maior que zero.
  #
  def has?(param)
  	param and param.length > 0
  end
  
end











