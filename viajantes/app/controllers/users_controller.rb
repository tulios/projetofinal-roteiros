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
      flash[:notice] = "Bem-vindo a bordo!"
    else
      # Recarrega os estados e as cidades se possivel
  		@states = State.load_all
  		  
  		if(not @user.city.nil?)
		    @cities = City.load_all(@user.city.state.id)			
			end
			
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
        format.html { redirect_to(edit_user_path(@user)) }
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
    @user = User.find(params[:user_id])
    
    logger.info @user.inspect

    if (@user.authenticated? params[:current_password])
      
      # Monta o hash para atualizar os atributos
      userHash = {:password => params[:user_password], 
                  :password_confirmation => params[:user_password_confirmation]}
      
      @user.update_attributes(userHash)
        
      if @user.errors.empty? 
        flash[:notice] = 'Seus dados foram atualizados com sucesso.'
        
        respond_to do |format|
          format.html { redirect_to(edit_user_path(@user)) }
        end
      
      else
        flash[:failure] = 'Não foi possível alterar a sua senha.'
        respond_to do |format|
          format.html { redirect_to(edit_user_path(@user)) }
        end
      end
        
    else
      flash[:failure] = 'A senha atual não confere.'
    
      respond_to do |format|
        format.html { redirect_to(edit_user_path(@user)) }
      end
    end
    
  end

end
