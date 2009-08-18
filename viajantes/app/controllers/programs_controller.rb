class ProgramsController < ApplicationController
	require_role "user"

  # GET /programs
  # GET /programs.xml
  def index
    @programs = Program.paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @programs }
    end
  end

  # GET /programs/1
  # GET /programs/1.xml
  def show
    @program = Program.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @program }
    end
  end

  # GET /programs/new
  # GET /programs/new.xml
  def new
    @program = Program.new
		@roadmap = Roadmap.find(params[:roadmap_id])
		@destination = Destination.find(params[:destination_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @program }
    end
  end

  # GET /programs/1/edit
  def edit
    @program = Program.find(params[:id])
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
        format.html { render :action => "new" }
        format.xml  { render :xml => @program.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /programs/1
  # PUT /programs/1.xml
  def update
    @program = Program.find(params[:id])
		params[:program][:date] = to_date(params[:program][:date])
		params[:program][:value] = currency_to_number(params[:program][:value])

    respond_to do |format|
      if @program.update_attributes(params[:program])
        flash[:notice] = 'Programa atualizado com sucesso.'
        format.html { redirect_to(@program) }
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
    @program.destroy

    respond_to do |format|
      format.html { redirect_to(programs_url) }
      format.xml  { head :ok }
    end
  end
end
