class ShopTipsController < ApplicationController
  require_role "user"
  
  # GET tourist_sight/tourist_sight_id/tips/new
  # GET tourist_sight/tourist_sight_id/tips/new.xml
  def new
    @shop_tip = ShopTip.new
    @shop_tip.tip = Tip.new
    @shop = Shop.find(params[:shop_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tip }
    end
  end

  def create
    @tip = Tip.new(params[:tip])
    @tip.user = current_user
    shop = Shop.find(params[:shop_id]) 
        
    @shop_tip = ShopTip.new(
      { :tip => @tip, 
        :shop => shop
      }
     )

    respond_to do |format|
      if @tip.save and @shop_tip.save
        flash[:notice] = 'Dica criada com sucesso.'
        format.html { 
					redirect_to(:controller => "shops", 
											:action => "show", 
											:id => @shop_tip.shop.id 
										 )
				}
      else
				# Recriando objeto e repopulando id de TouristSight
				@shop = Shop.find(params[:shop_id])
				
        format.html { render :action => "new" }
        format.xml  { render :xml => @shop_tip.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @shop_tip = ShopTip.find(params[:id])
    @shop_tip.destroy

    respond_to do |format|
      format.html { 
				redirect_to(:controller => "shops", 
										:action => "show", 
										:id => @shop_tip.shop.id 
									 )
			}
      format.xml  { head :ok }
    end
  end

end
