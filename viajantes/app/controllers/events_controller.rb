class EventsController < ApplicationController

  # GET /events
  # GET /events.xml
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
      
      @events = Event.paginate(	:conditions => condition,
      													:per_page => 10, :page => params[:page], :order => "time desc")
      
      @advance_search = true
    else    
      @events = Event.paginate(:per_page => 10, :page => params[:page], :order => "time desc")
    end
  	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])
		@city = @event.city
		@tips = @event.tips
		@evaluations = @event.evaluations(params[:page])
		@average = @event.evaluation_average

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
	def new
    @event = Event.new
		@states = State.load_all
	

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
		@states = State.load_all
		@cities = City.load_all(@event.city.state.id)
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])

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

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

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

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def has_city?
  	params[:state_id] and params[:state_id].length > 0 and 
    params[:city_id] and params[:city_id].length > 0
  end
  
  def has?(param)
  	param and param.length > 0
  end
  
  def to_string(date)
  	date.strftime("%d/%m/%Y")
  end
  
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





















