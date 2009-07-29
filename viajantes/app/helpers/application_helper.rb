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
	
	# Recebe uma lista de [id, mascara]. ex: [['field_1', '99/99/9999'], ['field_1', '(999) 9999-9999']]
	def mask_fields(list)
		fields = []
		list.each do |item|
			fields << %Q{
				$("#{'#'+item[0]}").mask("#{item[1]}");
			}
		end

		%Q{
			<script type="text/javascript">
				jQuery(function($){
					$(document).ready(function(){
						#{fields}
					});
				});
			</script>
		}
	end
end
