class TouristSightsController < ApplicationController
  # GET /tourist_sights
  # GET /tourist_sights.xml
  def index
    @tourist_sights = TouristSight.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tourist_sights }
    end
  end

  # GET /tourist_sights/1
  # GET /tourist_sights/1.xml
  def show
    @tourist_sight = TouristSight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tourist_sight }
    end
  end

  # GET /tourist_sights/new
  # GET /tourist_sights/new.xml
  def new
    @tourist_sight = TouristSight.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tourist_sight }
    end
  end

  # GET /tourist_sights/1/edit
  def edit
    @tourist_sight = TouristSight.find(params[:id])
  end

  # POST /tourist_sights
  # POST /tourist_sights.xml
  def create
    @tourist_sight = TouristSight.new(params[:tourist_sight])

    respond_to do |format|
      if @tourist_sight.save
        flash[:notice] = 'TouristSight was successfully created.'
        format.html { redirect_to(@tourist_sight) }
        format.xml  { render :xml => @tourist_sight, :status => :created, :location => @tourist_sight }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tourist_sight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tourist_sights/1
  # PUT /tourist_sights/1.xml
  def update
    @tourist_sight = TouristSight.find(params[:id])

    respond_to do |format|
      if @tourist_sight.update_attributes(params[:tourist_sight])
        flash[:notice] = 'TouristSight was successfully updated.'
        format.html { redirect_to(@tourist_sight) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tourist_sight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tourist_sights/1
  # DELETE /tourist_sights/1.xml
  def destroy
    @tourist_sight = TouristSight.find(params[:id])
    @tourist_sight.destroy

    respond_to do |format|
      format.html { redirect_to(tourist_sights_url) }
      format.xml  { head :ok }
    end
  end
end