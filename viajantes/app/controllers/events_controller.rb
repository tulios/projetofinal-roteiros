# EventsController - Controlador de Eventos
# 
# Este controlador é responsável por processar e 
# responder as requisições relativas aos eventos. 
# 
class EventsController < ApplicationController
  require_role "user", :for_all_except => [:index, :show]

  # GET /events
  # GET /events.xml
  # 
	# Carrega todos os eventos de uma cidade dentro de um período específico.
	#
	# Params:
	#   - state_id (Id do estado)
	#   - city_id (Id da cidade)
	#   - start (Data de inicio)
	#   - end (Data final)
	#
  def index
  	@states = State.load_all
  	             
  	# Se nao tiver cidade, filtra pela cidade do usuario               
  	if logged_in? and (not has_city?)  
  	  params[:state_id] = current_user.city.state.id.to_s
  	  params[:city_id] = current_user.city.id.to_s
  	end
  	
  	# Caso tenha usado a pesquisa, seleciona pela cidade e/ou pelas datas
    if (has_city? or has?(params[:start]) or has?(params[:end]))
       
    	att = []
      query = []
    	
    	# Verifica se a data de inicio foi informada   
      if (has?(params[:start]))
	      @start = Converters::to_date(params[:start])
	      
	      # Verifica se a data foi convertida corretamente, se eh uma data valida
	      if @start
	        query << "time >= ?"
  	      att << @start
  	    end
        
        # Se for uma data invalida, recebera nil, e limpara o campo na tela
	     	@start = Converters::date_to_string(@start)
      end

    	# Verifica se a data de fim foi informada      
      if has?(params[:end])
	      @end = Converters::to_date(params[:end])
	      
 	      # Verifica se a data foi convertida corretamente, se eh uma data valida
	      if @end
	        query << "time <= ?"
	      
  	      @end = @end.change(:hour => 23)
  	      @end = @end.change(:min => 59)
  				@end = @end.change(:sec => 59)
	      
  	      att << @end
  	    end   
	      
        # Se for uma data invalida, recebera nil, e limpara o campo na tela
 	      @end = Converters::date_to_string(@end)
      end
  		
    	# Verifica se a cidade e o estado foram informados
  		if has_city?    
		    @state_id = Integer(params[:state_id])
		    @city_id = Integer(params[:city_id])
		    @cities = City.load_all(@state_id)
		    query << "city_id = ?"
	      att << @city_id
		  end
      
      # Prepara a query com os dados informados
      condition = ActiveRecordUtil.prepare_condition(query, att)
      
      @events = Event.paginate(:conditions => condition,
      												 :per_page => Config::PAGE_SIZE, :page => params[:page], :order => "time desc")
    else    
      @events = Event.paginate(:per_page => Config::PAGE_SIZE, :page => params[:page], :order => "time desc")
    end
  	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/id
  # GET /events/id.xml
  # 
	# Exibe os dados do evento.
	#
	# Params:
	#   - id (Id do evento)
	#   - page (número da página da paginação de avaliações)
	#
  def show
    @event = Event.find(params[:id])
		@city = @event.city
		@tips = @event.tips(params[:page_tips])
		@evaluations = @event.evaluations(params[:page])
		@average = @event.evaluation_average

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  # 
	# Carrega a tela para a criação de um novo evento.
	#
	def new
    @event = Event.new
		@states = State.load_all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/id/edit
  # GET /events/id/edit.xml
  # 
	# Carrega a tela de edição de evento.
	#
	# Params:
	#   - id (Id do evento)
	#
  def edit
    @event = Event.find(params[:id])     
    
    if not validate_permission(@event)
      return
    end
    
		# Recarrega os estados e as cidades se possivel
		load_states_and_cities(@event)
  end

  # POST /events
  # POST /events.xml
  # 
	# Cria um novo evento com os dados submetidos
	#
	# Params:
	#   - event (Hash com os dados do evento)
	#
  def create
    @event = Event.new(params[:event])
    @event.cost = Converters::currency_to_number(params[:event][:cost])
    @event.user = current_user

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Evento criado com sucesso.'
        format.html { redirect_to(@event) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
				# Recarrega os estados e as cidades se possivel
				load_states_and_cities(@event)
				
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/id
  # PUT /events/id.xml
  # 
	# Atualiza um evento com os dados submetidos.
	#
	# Params:
	#   - id (Id do evento)
	#   - event (Hash com os dados do evento)
	#
  def update
    @event = Event.find(params[:id])
    params[:event][:cost] = Converters::currency_to_number(params[:event][:cost])

    if not validate_permission(@event)
      return
    end

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Evento atualizado com successo.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
				# Recarrega os estados e as cidades se possivel
				load_states_and_cities(@event)
				
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/id
  # DELETE /events/id.xml
  # 
	# Exclui um evento
	#
	# Params:
	#   - id (Id do evento)
	#
  def destroy
    @event = Event.find(params[:id])
                                          
    # Verifica se o usuario tem permissao para isso
    if not validate_permission(@event)
      return
    end
                                                                                                                           
    # Verifica se o evento ainda possui algum relacionamento com avaliacao e dica
    if (@event.tips and @event.tips.length > 0) or (@event.evaluations and @event.evaluations.length > 0)
      flash[:error] = 'Este evento ainda possui avaliações ou dicas, apague-os antes de tentar excluir.'
      respond_to do |format|
          format.html { redirect_to @event }
      end             
      return
    end
    
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
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





















