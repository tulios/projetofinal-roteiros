# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def show_success()
     if flash[:notice]
       %Q{
          <p class="success">#{flash[:notice]}</p>
        }
     end
   end
end
