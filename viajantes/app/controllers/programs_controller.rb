# ProgramsController - Controlador de Programas
# 
# Este controlador é responsável por processar e 
# responder as requisições relativas aos programas. 
# 
class ProgramsController < ApplicationController
	require_role "user"

  # GET /roadmaps/roadmap_id/destinations/destination_id/programs/new
  # GET /roadmaps/roadmap_id/destinations/destination_id/programs/new.xml
  # 
	# Carrega o tela para criação de um novo programa.
	#
	# Params:
	#   - roadmap_id (Id do roteiro)
	#   - destination_id (Id do destino)
	#
  def new
    @program = Program.new
		@roadmap = Roadmap.find(params[:roadmap_id])
		@destination = Destination.find(params[:destination_id])
                                    
    if not validate_permission(@roadmap)
      return
    end

		city_id = @destination.city.id
		@tourist_sights = TouristSight.find_all_by_city_id(city_id, :order => "name asc")
		@shops = Shop.find_all_by_city_id(city_id, :order => "name asc")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @program }
    end
  end

  # GET /roadmaps/roadmap_id/destinations/destination_id/programs/id/edit
  # GET /roadmaps/roadmap_id/destinations/destination_id/programs/id/edit.xml
  # 
	# Carrega a tela de edição de um programa.
	#
	# Params:
	#   - roadmap_id (Id do roteiro)
	#   - destination_id (Id do destino)   
	#   - id (Id do programa)
	#
  def edit
    @program = Program.find(params[:id])
		@destination = @program.destination
		@roadmap = @program.destination.roadmap
		                                
		if not validate_permission(@roadmap)
      return
    end
		
		city_id = @destination.city.id
		@tourist_sights = TouristSight.find_all_by_city_id(city_id, :order => "name asc")
		@shops = Shop.find_all_by_city_id(city_id, :order => "name asc")
  end

  # POST /roadmaps/roadmap_id/destinations/destination_id/programs
  # POST /roadmaps/roadmap_id/destinations/destination_id/programs.xml
  # 
	# Cria um novo programa com os dados submetidos.
	#
	# Params:
	#   - roadmap_id (Id do roteiro)
	#   - destination_id
	#   - program (Hash com os dados do programa)
	#
  def create
    # Gerando simbolo da string
    if params[:program][:happens_in]  	
		  params[:program][:happens_in] = params[:program][:happens_in].intern
		end
		
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
		                        
		@destination = Destination.find(params[:destination_id])
		@roadmap = @destination.roadmap                                       
		         
		if not validate_permission(@roadmap)
      return
    end
		
    @program = Program.new(params[:program])
		@program.destination = @destination
		@program.date = Converters::to_date(params[:program][:date], true)
		@program.value = Converters::currency_to_number(params[:program][:value])
                      
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

  # PUT /roadmaps/roadmap_id/destinations/destination_id/programs/id
  # PUT /roadmaps/roadmap_id/destinations/destination_id/programs/id.xml
  # 
	# Atualiza os dados de um programa com os dados submetidos.
	#
	# Params:
	#   - roadmap_id (Id do roteiro)
	#   - destination_id (Id do destino)
	#   - id (Id do programa)
	#   - programa(Hash com os dados do programa)
	#
  def update
    # Gerando simbolo da string
  	if params[:program][:happens_in]  	
		  params[:program][:happens_in] = params[:program][:happens_in].intern
		end
		
    @program = Program.find(params[:id])
		params[:program][:date] = Converters::to_date(params[:program][:date], true)
		params[:program][:value] = Converters::currency_to_number(params[:program][:value])

		@roadmap = @program.destination.roadmap
		@destination = @program.destination
		                                       
		if not validate_permission(@roadmap)
      return
    end
		
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

  # DELETE /roadmaps/roadmap_id/destinations/destination_id/programs/id
  # DELETE /roadmaps/roadmap_id/destinations/destination_id/programs/id.xml
  # 
	# Exclui um programa.
	#
	# Params:
	#   - roadmap_id (Id do roteiro)
	#   - destination_id (Id do destino)
	#   - id (Id do programa)
	#
  def destroy
    @program = Program.find(params[:id])
		@roadmap = @program.destination.roadmap
                         
    if not validate_permission(@roadmap)
      return
    end

    @program.destroy

    respond_to do |format|
      format.html { redirect_to(@roadmap) }
      format.xml  { head :ok }
    end
  end
end














