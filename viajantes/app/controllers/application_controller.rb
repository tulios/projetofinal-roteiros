# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include RoleRequirementSystem
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  def verify_user (user_id, methods)
    
    methods.each do |method|
      if(self.action_name == method.to_s)
        unless(current_user.me?(user_id))
          access_denied
        end
      end
    end    
  end

	def currency_to_number(currency)
  	return currency.gsub(/[\.]/, '').gsub(/[,]/, '.').gsub(/[A-Z]/, '').gsub(/[$]/, '').gsub(/[\s]/, '').to_f
	end

	def to_date(string, delimiter = '/')
		if string and string.length > 0
			begin
				array = string.split(delimiter)
			  Date.new(array[2].to_i,array[1].to_i,array[0].to_i) 
			rescue
				return nil
			end
		end
		nil
	end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password 
end
