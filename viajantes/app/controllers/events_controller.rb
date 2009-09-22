# EventsController - Controlador de Eventos
# 
# Este controlador é responsável por processar e 
# responder as requisições relativas aos eventos. 
# 
class EventsController < ApplicationController

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
  	
  	# Caso tenha usado a pesquisa, seleciona pela cidade e/ou pelas datas
    if (has_city? or has?(params[:start]) or has?(params[:end]))
       
    	att = []
      query = []
    	
    	# Verifica se a data de inicio foi informada   
      if (has?(params[:start]))
	      @start = to_date(params[:start])
	      query << "time >= ?"
	      att << @start
	      
	     	@start = to_string(@start)
      end

    	# Verifica se a data de fim foi informada      
      if has?(params[:end])
	      @end = to_date(params[:end])
	      query << "time <= ?"
	      
	      @end = @end.change(:hour => 23)
	      @end = @end.change(:min => 59)
				@end = @end.change(:sec => 59)
	      
	      att << @end
	      
 	      @end = to_string(@end)
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
      condition = prepare_condition(query, att)
      
      @events = Event.paginate(:conditions => condition,
      												 :per_page => Config::PAGE_SIZE, :page => params[:page], :order => "time desc")
      
      @advance_search = true
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

  # GET /events/id/edit.xml
  # GET /events/id/new.xml
  # 
	# Carrega a tela de edição de evento.
	#
	# Params:
	#   - id (Id do evento)
	#
  def edit
    @event = Event.find(params[:id])
		@states = State.load_all
		@cities = City.load_all(@event.city.state.id)
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
    @event.cost = currency_to_number(params[:event][:cost])
    @event.user = current_user

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Evento criado com sucesso.'
        format.html { redirect_to(@event) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
				@states = State.load_all
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
    params[:event][:cost] = currency_to_number(params[:event][:cost])

    if not owner?(@event)
      flash[:error] = 'Você não tem permissão para alterar o evento.'
      respond_to do |format|
          format.html { redirect_to @event }
      end
      return 
    end

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Evento atualizado com successo.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
				@states = State.load_all
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
    
    if not owner?(@event)
      flash[:error] = 'Você não tem permissão para apagar o evento.'
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
  
  # Converte uma data em uma string no formato dd/mm/aaaa
  #
  def to_string(date)
  	date.strftime("%d/%m/%Y")
  end
  
  # Monta uma query a partir das condições e os valores passados por parametro
  #
  def prepare_condition(query, att)
  	condition = []

		joined_query = ""
		
		query.each do |q|
			joined_query << "#{q} and "
		end
		
		joined_query.strip!.gsub!(/and\Z/, '')
		condition << joined_query
		
		att.each do |a|
			condition << a
		end
		
		condition
  end
end





















