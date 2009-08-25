class ProgramsController < ApplicationController
	require_role "user"

  # GET /programs/new
  # GET /programs/new.xml
  def new
    @program = Program.new
		@roadmap = Roadmap.find(params[:roadmap_id])
		@destination = Destination.find(params[:destination_id])

		city_id = @destination.city.id
		@tourist_sights = TouristSight.find_all_by_city_id(city_id)
		@shops = Shop.find_all_by_city_id(city_id)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @program }
    end
  end

  # GET /programs/1/edit
  def edit
    @program = Program.find(params[:id])
		@destination = @program.destination
		@roadmap = @program.destination.roadmap
		
		city_id = @destination.city.id
		@tourist_sights = TouristSight.find_all_by_city_id(city_id)
		@shops = Shop.find_all_by_city_id(city_id)
  end

  # POST /programs
  # POST /programs.xml
  def create
    @program = Program.new(params[:program])
		@program.destination = Destination.find(params[:destination_id])
		@program.date = to_date(params[:program][:date])
		@program.value = currency_to_number(params[:program][:value])

    respond_to do |format|
      if @program.save
        flash[:notice] = 'Programa criado com sucesso.'
        format.html { redirect_to(@program.destination.roadmap) }
        format.xml  { render :xml => @program.destination.roadmap, 
														 :status => :created, :location => @program.destination.roadmap }
      else
				@destination = @program.destination
				@roadmap = @program.destination.roadmap

        format.html { render :action => "new" }
        format.xml  { render :xml => @program.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /programs/1
  # PUT /programs/1.xml
  def update
	  params[:program][:happens_in] = params[:program][:happens_in].intern
    @program = Program.find(params[:id])
		params[:program][:date] = to_date(params[:program][:date])
		params[:program][:value] = currency_to_number(params[:program][:value])

		@roadmap = @program.destination.roadmap
		@destination = @program.destination
		
		# Regra para que apenas 1 seja marcado por vez (tourist_sight ou shop)
		case params[:program][:happens_in]
			when :tourist_sight
				params[:program][:shop_id] = nil
			when :shop
				params[:program][:tourist_sight_id] = nil
			else
				params[:program][:tourist_sight_id] = nil
				params[:program][:shop_id] = nil
		end
		
    respond_to do |format|
      if @program.update_attributes(params[:program])
        flash[:notice] = 'Programa atualizado com sucesso.'
        format.html { redirect_to(@roadmap) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @program.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.xml
  def destroy
    @program = Program.find(params[:id])
		roadmap = @program.destination.roadmap

    @program.destroy

    respond_to do |format|
      format.html { redirect_to(roadmap) }
      format.xml  { head :ok }
    end
  end
end














