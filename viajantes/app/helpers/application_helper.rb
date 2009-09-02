# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	
	def show_success
     if flash[:notice]
       %Q{
          <p class="success">#{flash[:notice]}</p>
        }
     end
  end

  def show_failure
     if flash[:error]
       %Q{
          <p class="failure">#{flash[:error]}</p>
        }
     end
  end

	def check_tab?(*name)
		name.each do |var|
			if var == controller_name then return "marcado" end
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

	def configure_tabs(selected)
		add = ""
		if selected 
			add = "{selected: #{selected}}"
		end

		%Q{
			<script type="text/javascript">
				$(document).ready (function() {
					$("#tabs").tabs(#{add});
				});
			</script>
		}
	end

	def submit(id_form)
		%Q{
			javascript: $('#{'#'+id_form}').submit();
		}
	end

	# Mantem o valor do campo informado (id) com o texto informado (text) caso
	# seu valor fique vazio.
	def keep_value(text, id)
		%Q{
			javascript: keep_value('#{text}', '#{id}');
		}
	end
	
	def collapse_box(arrow1_id, arrow2_id, content_id)
		%Q{
			javascript: collapse_box('#{arrow1_id}', '#{arrow2_id}', '#{content_id}');
		}
	end

	def currency(value)
		number_to_currency(value, :unit => "R$", :format => "%u %n")
	end
	
	def price_format(field_ids)
		fields = []
		field_ids.each do |field_id|
			fields << %Q{
				$("#{'#'+field_id}").priceFormat(
					{
						prefix: 'R$ ',
						centsSeparator: ',',  
						thousandsSeparator: '.'
					}
				);
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

	# Recebe um hash {id => mascara}. ex: {:field_1 => '99/99/9999', :field_2 => '(999) 9999-9999'}
	def mask_fields(hash)
		fields = []
		hash.keys.each do |key|
			fields << %Q{
				$("#{'#'+(key.to_s)}").mask("#{hash[key]}");
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
	
	# Formata a data no formato brasileiro: dd/mm/YYYY
	def date_format(date)
	  if date
	   date.strftime("%d/%m/%Y")
	  end
	end
	
	def focus(id)
	  %Q{
			<script type="text/javascript">
				jQuery(function($){
					$(document).ready(function(){
					  $("#{'#'+(id)}").focus();
					});
				});
			</script>
		}
	end
	
	def ruby_hash_to_javascript_array(hash)
		result = "["
		hash.keys.each_with_index do |key, index|			
			result << "'#{key}'"
			if index < (hash.keys.length - 1)
				result << ", "
			end
		end
		result << "]"
		result
	end
	
	def corner(*ids)
		result = ""
		ids.each do |id|
			result << %Q{
				$("#{'#'+(id)}").corner(); 
			}
		end
		%Q{
			<script type="text/javascript">
				jQuery(function($){
					$(document).ready(function(){
					  #{result}
					});
				});
			</script>
		}
	end
	
	def rating(name, size = 5, disabled = false, check = nil, div = true, div_id = "#{'div_'+name.to_s}")
		result = ""
	
		if div
			result << "<div id=\"#{div_id}\">"
		end
		
		size.times do |number|
			result << %Q{
				<input name="#{name.to_s}" type="radio" class="star" value="#{number + 1}" 
			}
			if check and check == (number + 1)
				result << "checked=\"checked\""
			end
			if disabled
				result << "disabled=\"disabled\""
			end
			result << "/>"
		end
		
		if div
			result << "</div>"
		end
		
		result
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
  
	def evaluation_path_generator(evaluation)
		case controller_name.intern
			when :shops
				return shop_shop_evaluation_path(params[:id],evaluation.especified_type)
		end
	end
	
	def evaluation_hash_destroyer(evaluation)
		case controller_name.intern
			when :shops
				return {:action => "destroy", :controller => :shop_evaluations,
							  :confirm => 'Você tem certeza?', :method => :delete,
							  :title => "Apagar"}
		end
	end
	
	def tip_path_generator(tip)
		case controller_name.intern
			when :tourist_sights
				return tourist_sight_tourist_sight_tip_path(params[:id],tip.especified_type)
			
			when :shops
				return shop_shop_tip_path(params[:id],tip.especified_type)
		end
	end
	
	def tip_hash_destroyer(tip)
		case controller_name.intern
			when :tourist_sights
				return {:action => "destroy", :controller => :tourist_sight_tips,
							  :confirm => 'Você tem certeza?', :method => :delete,
							  :title => "Apagar"}
							  
			when :shops
				return {:action => "destroy", :controller => :shop_tips,
							  :confirm => 'Você tem certeza?', :method => :delete,
							  :title => "Apagar"}
		end
	end

end























