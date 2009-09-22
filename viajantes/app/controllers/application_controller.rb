# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include RoleRequirementSystem
	include Converters
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password 

	# Filtros utilitarios
  def verify_user (user_id, methods)
    methods.each do |method|
      if(self.action_name == method.to_s)
        unless(current_user.me?(user_id))
          access_denied
        end
      end
    end    
  end
  
  # Carrega os estados e as cidades se possivel
	def load_states_and_cities(object_with_city)
		# carrega novamente os estados para exibir no combo
		@states = State.load_all
		# carrega novamente as cidades se o estado tiver sido informado
		if object_with_city and object_with_city.city
			@cities = City.load_all(object_with_city.city.state.id)
		end
	end
	
	# Retorna true se o usuário logado for o dono do objeto 
	# passado por parâmetro e retorna false caso o contrário
	def owner?(object)
	  if(object and object.user and current_user)
	    if(object.user.id == current_user.id)
	      return true
      end
	  end
	  
	  return false;
  end

end






















