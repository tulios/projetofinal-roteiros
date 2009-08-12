class RoadmapsController < ApplicationController
  # GET /roadmaps
  # GET /roadmaps.xml
  def index
    @roadmaps = Roadmap.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @roadmaps }
    end
  end

  # GET /roadmaps/1
  # GET /roadmaps/1.xml
  def show
    @roadmap = Roadmap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @roadmap }
    end
  end

  # GET /roadmaps/new
  # GET /roadmaps/new.xml
  def new
    @roadmap = Roadmap.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @roadmap }
    end
  end

  # GET /roadmaps/1/edit
  def edit
    @roadmap = Roadmap.find(params[:id])
  end

  # POST /roadmaps
  # POST /roadmaps.xml
  def create
    @roadmap = Roadmap.new(params[:roadmap])

    respond_to do |format|
      if @roadmap.save
        flash[:notice] = 'Roadmap was successfully created.'
        format.html { redirect_to(@roadmap) }
        format.xml  { render :xml => @roadmap, :status => :created, :location => @roadmap }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @roadmap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /roadmaps/1
  # PUT /roadmaps/1.xml
  def update
    @roadmap = Roadmap.find(params[:id])

    respond_to do |format|
      if @roadmap.update_attributes(params[:roadmap])
        flash[:notice] = 'Roadmap was successfully updated.'
        format.html { redirect_to(@roadmap) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @roadmap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /roadmaps/1
  # DELETE /roadmaps/1.xml
  def destroy
    @roadmap = Roadmap.find(params[:id])
    @roadmap.destroy

    respond_to do |format|
      format.html { redirect_to(roadmaps_url) }
      format.xml  { head :ok }
    end
  end
end
