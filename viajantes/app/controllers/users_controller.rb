class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # render new.rhtml
  def new
    @user = User.new(:sex => "x")
    @states = State.load_all
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      @states = State.load_all
      render :action => 'new'
    end
  end
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
		@states = State.load_all
		@cities = City.load_all(@user.city.state.id)
	end
	
	# PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Seus dados foram atualizados com sucesso.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
  			# Recarrega os estados e as cidades se possivel
  		  @states = State.load_all
  		  
  		  if(not @user.city.nil?)
		      @cities = City.load_all(@user.city.state.id)			
				end
				
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
     end
  end
  
  # PUT /users/1/update_password
  def update_password
    @user = User.find(params[:id])

    if (@user.authenticated? params[:current_password])
      respond_to do |format|
        if @user.update_attributes(params[:user])
          flash[:notice] = 'Seus dados foram atualizados com sucesso.'
          format.html { redirect_to(@user) }
        else
  			  # Recarrega os estados e as cidades se possivel
  		    @states = State.load_all
  		    @cities = City.load_all(@user.city.state.id)			
				
          format.html { render :action => "edit" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

end
