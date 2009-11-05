class TouristSightTipsController < ApplicationController
  require_role "user"
  
  # GET tourist_sight/tourist_sight_id/tips/new
  # GET tourist_sight/tourist_sight_id/tips/new.xml
  def new
    @tourist_sight_tip = TouristSightTip.new
    @tourist_sight_tip.tip = Tip.new
    @tourist_sight = TouristSight.find(params[:tourist_sight_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tip }
    end
  end

  def create
    @tip = Tip.new(params[:tip])
    @tip.user = current_user
    tourist_sight = TouristSight.find(params[:tourist_sight_id]) 
        
    @tourist_sight_tip = TouristSightTip.new({
    	:tip => @tip, :tourist_sight => tourist_sight
    })

    respond_to do |format|
      if @tip.save and @tourist_sight_tip.save
        flash[:notice] = 'Dica criada com sucesso.'
        format.html { 
					redirect_to(:controller => "tourist_sights", 
											:action => "show", 
											:id => @tourist_sight_tip.tourist_sight.id 
										 )
				}
      else
				# Recriando objeto e repopulando id de TouristSight
				@tourist_sight = TouristSight.find(params[:tourist_sight_id])

        format.html { render :action => "new" }
        format.xml  { render :xml => @tourist_sight_tip.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @tourist_sight_tip = TouristSightTip.find(params[:id])
    @tourist_sight_tip.destroy

    respond_to do |format|
      format.html { 
				redirect_to(:controller => "tourist_sights", 
										:action => "show", 
										:id => @tourist_sight_tip.tourist_sight.id 
									 )
			}
      format.xml  { head :ok }
    end
  end

end
