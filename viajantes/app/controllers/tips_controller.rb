class TipsController < ApplicationController
  # GET /tips
  # GET /tips.xml
  def index
  	@tourist_sight = TouristSight.find(params[:tourist_sight_id])
  	@city = @tourist_sight.city
    @tips = Tip.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tips }
    end
  end

  # GET /tips/1
  # GET /tips/1.xml
  def show
    @tip = Tip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tip }
    end
  end

  # GET /tips/new
  # GET /tips/new.xml
  def new
    @tip = Tip.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tip }
    end
  end

  # GET /tips/1/edit
  def edit
    @tip = Tip.find(params[:id])
    @tourist_sight = @tip.tourist_sight
    
    respond_to do |format|
      format.html # edit.html.erb
      format.xml  { render :xml => @tip }
    end
  end

  # POST /tips
  # POST /tips.xml
  def create
    @tip = Tip.new(params[:tip])
    @tip.tourist_sight = TouristSight.find(params[:tourist_sight_id])

    respond_to do |format|
      if @tip.save
        flash[:notice] = 'Tip was successfully created.'
        format.html { redirect_to(:action => "index", 
        		:tourist_sight_id => @tip.tourist_sight.id ) }
        format.xml  { render :xml => @tip, :status => :created, :location => @tip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tips/1
  # PUT /tips/1.xml
  def update
    @tip = Tip.find(params[:id])

    respond_to do |format|
      if @tip.update_attributes(params[:tip])
        flash[:notice] = 'Tip was successfully updated.'
        format.html { redirect_to(:action => "index",
        		:tourist_sight_id => @tip.tourist_sight.id ) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tips/1
  # DELETE /tips/1.xml
  def destroy
    @tip = Tip.find(params[:id])
    @tip.destroy

    respond_to do |format|
      format.html { redirect_to(:action => "index", 
      		:tourist_sight_id => @tip.tourist_sight.id ) }
      format.xml  { head :ok }
    end
  end
end
