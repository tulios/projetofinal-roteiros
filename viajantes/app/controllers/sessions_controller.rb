# SessionsController - Controlador de sessões
# 
# Este controlador é responsável por tratar as 
# funcionalidades de login e logout do sistema.
# 
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  #include AuthenticatedSystem

  # POST /sessions
  # POST /sessions.xml
  # 
	# Loga o usuário no sistema inserindo-o na sessão.
	#
	# Params:
	#   - event (Hash com os dados do evento)
	#
  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { 
        	:value => self.current_user.remember_token , 
        	:expires => self.current_user.remember_token_expires_at 
        }
      end
      flash.clear
      redirect_back_or_default('/')
    else
      flash[:error] = "Usuário ou senha inválido"
      render :action => 'new'
    end
  end

  # DELETE /sessions
  # DELETE /sessions
  # 
	# Desloga o usuário da sistema retirando-o da sessão.
	#
  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    redirect_back_or_default('/login')
  end
end
