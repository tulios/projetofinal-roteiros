# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include RoleRequirementSystem
	include Converters
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password 

	# Filtros utilitários     
	
	# Verifica se o usuário informado é o único que pode utilizar os métodos informados.
	# Caso não seja executa o método <b>access_denied</b> e nega a chamada.
	#
	# params:
	#   - Integer: user_id (O id do usuário que se deseja verificar)
	#   - []: methods (Array de métodos que serão verificados)
	#
  def verify_user (user_id, methods)
    methods.each do |method|
      if(self.action_name == method.to_s)
        unless(current_user.me?(user_id))
          access_denied
        end
      end
    end    
  end
  
  # Carrega os estados e as cidades se possível
  #
  # params:
  #   - Object: object_with_city (Objeto associado a uma cidade)
  #
	def load_states_and_cities(object_with_city)
		# carrega novamente os estados para exibir no combo
		@states = State.load_all
		# carrega novamente as cidades se o estado tiver sido informado
		if object_with_city and object_with_city.city
			@cities = City.load_all(object_with_city.city.state.id)
		end
	end

	# Retorna true se o usuário logado for o dono do objeto 
	# passado por parâmetro e retorna false caso o contrário.
	#
	# params:
	#   - Object: object (Objeto associado a um usuário)
	#
	def owner?(object)
	  if(object and object.user and current_user)
	    if(object.user.id == current_user.id)
	      return true
      end
	  end
	  
	  return false;
  end        
                 
  # Valida a permissão de acesso ao objeto passado. Caso o usuário corrente
  # não possua permissão ocorre um redirect para o show do objeto informado.  
  #
  # params:
  #   - Object: object (Objeto associado a um usuário)      
  #
  def validate_permission(object)
    if not owner?(object)
      flash[:error] = 'Você não tem permissão para isso.'
      respond_to do |format|
          format.html { redirect_to object }
      end
      return false
    end 
    
    true                 
  end    

end






















