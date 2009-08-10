# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  # You can move this into a different controller, if you wish.  This module gives you the require_role helpers, and others.
  include RoleRequirementSystem

  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  def verify_user (user_id, methods)
    
    methods.each do |method|
      if(self.action_name == method.to_s)
        unless(current_user.me? (user_id))
          access_denied
        end
      end
    end    
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password 
end
