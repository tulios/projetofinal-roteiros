require 'mapsfinder'

class ShopsController < ApplicationController
	require_role "user", :for_all_except => [:index, :show]

  # GET /shops
  # GET /shops.xml
  def index
    @shops = Shop.paginate(:per_page => 10, :page => params[:page], :order => "hits desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shops }
    end
  end

  # GET /shops/1
  # GET /shops/1.xml
  def show
    @shop = Shop.find(params[:id])
    @evaluations = Evaluation.paginate(
    	:joins => "inner join shop_evaluations se on se.evaluation_id = evaluations.id",
    	:per_page => 5, 
    	:page => params[:page], 
    	:order => "created_at desc"
    )
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

				load_states_and_cities

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
				
				load_states_and_cities

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

	private

	def load_states_and_cities
		# carrega novamente os estados para exibir no combo
		@states = State.load_all
		# carrega novamente as cidades se o estado tiver sido informado
		if @shop and @shop.city
			@cities = City.load_all(@shop.city.state.id)
		end
	end

end




















