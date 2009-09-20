require 'mapsfinder'

class ShopsController < ApplicationController
	require_role "user", :for_all_except => [:index, :show]

  # GET /shops
  # GET /shops.xml
  def index
    @states = State.load_all
    
    # Caso tenha usado a pesquisa, seleciona pela cidade
    if params[:state_id] and params[:state_id].length > 0 and 
       params[:city_id] and params[:city_id].length > 0
      
      @state_id = Integer(params[:state_id])
      @city_id = Integer(params[:city_id])
      @cities = City.load_all(@state_id)
      
      @shops = Shop.paginate(:conditions => ["city_id = ?", @city_id],
                             :per_page => Config::PAGE_SIZE, 
                             :page => params[:page], :order => "hits desc")
      
      @advance_search = true
    else    
      @shops = Shop.paginate(:per_page => Config::PAGE_SIZE, 
      											 :page => params[:page], :order => "hits desc")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shops }
    end
  end

  # GET /shops/1
  # GET /shops/1.xml
  def show
    @shop = Shop.find(params[:id])
    @evaluations = @shop.evaluations(params[:page])
    @tips = @shop.tips(params[:page_tips])
    @average = @shop.evaluation_average
		@city = @shop.city
		@shop.increase_hits

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shop }
    end
  end

  # GET /shops/new
  # GET /shops/new.xml
  def new
    @shop = Shop.new
		@states = State.load_all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shop }
    end
  end

  # GET /shops/1/edit
  def edit
    @shop = Shop.find(params[:id])
		@states = State.load_all

		state_id = @shop.city.state.id
		city_id = @shop.city.id
		
		@cities = City.load_all(state_id)
		@tourist_sights = TouristSight.find_all_by_city_id(city_id)
  end

  # POST /shops
  # POST /shops.xml
  def create
    @shop = Shop.new(params[:shop])
    @shop.user_id = current_user.id

    respond_to do |format|
      if @shop.save
        flash[:notice] = 'Estabelecimento criado com sucesso.'
        format.html { redirect_to(@shop) }
        format.xml  { render :xml => @shop, :status => :created, :location => @shop }
      else

				load_states_and_cities(@shop)

        format.html { render :action => "new" }
        format.xml  { render :xml => @shop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shops/1
  # PUT /shops/1.xml
  def update
    @shop = Shop.find(params[:id])

    respond_to do |format|
      if @shop.update_attributes(params[:shop])
        flash[:notice] = 'Estabelecimento atualizado com sucesso.'
        format.html { redirect_to(@shop) }
        format.xml  { head :ok }
      else
				
				load_states_and_cities(@shop)

        format.html { render :action => "edit" }
        format.xml  { render :xml => @shop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.xml
  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy

    respond_to do |format|
      format.html { redirect_to(shops_url) }
      format.xml  { head :ok }
    end
  end

end




















