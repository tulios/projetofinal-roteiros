class EventTipsController < ApplicationController

  require_role "user"
  
  def new
    @event_tip = ShopTip.new
    @event_tip.tip = Tip.new
    @event = Event.find(params[:event_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tip }
    end
  end

  def create
    @tip = Tip.new(params[:tip])
    @tip.user = current_user
    event = Event.find(params[:event_id]) 
        
    @event_tip = EventTip.new(
      { :tip => @tip, 
        :event => event
      }
     )

    respond_to do |format|
      if @tip.save and @event_tip.save
        flash[:notice] = 'Dica criada com sucesso.'
        format.html { 
					redirect_to(:controller => "events", 
											:action => "show", 
											:id => @event_tip.event.id 
										 )
				}
      else
				# Recriando objeto e repopulando id de Event
				@event = Event.find(params[:event_id])
				
        format.html { render :action => "new" }
        format.xml  { render :xml => @event_tip.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @event_tip = EventTip.find(params[:id])
    @event_tip.destroy

    respond_to do |format|
      format.html { 
				redirect_to(:controller => "events", 
										:action => "show", 
										:id => @event_tip.event.id 
									 )
			}
      format.xml  { head :ok }
    end
  end
end
