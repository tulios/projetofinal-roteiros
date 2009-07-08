# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def show_success
     if flash[:notice]
       %Q{
          <p class="success">#{flash[:notice]}</p>
        }
     end
   end

		def configure_textarea_autogrow
		%Q{
			<script type="text/javascript">
				$(document).ready (function() {
					$('textarea.expanding').autogrow();
				});
			</script>
		}
	end
	
	def collapse_box(arrow1_id, arrow2_id, content_id)
		%Q{
			javascript: collapse_box('#{arrow1_id}', '#{arrow2_id}', '#{content_id}');
		}
	end
end
