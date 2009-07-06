module TouristSightTagsHelper
	
	def configure_asmselect(select_id)
		%Q{
			<script type="text/javascript">
				$(document).ready(function() {
					$("##{select_id}").asmSelect({
						addItemTarget: 'bottom',
						animate: true,
						highlight: true,
						sortable: true,
						highlightAddedLabel: 'Adicionado: ',
						highlightRemovedLabel: 'Retirado: ',
						removeLabel: 'Retirar'
					});
			
				});
			</script>
		} 
	end
	
	def show_tags(tourist_sight)
		content = ""		
		tourist_sight.tags.each_with_index do |tag, index|
			if (index > 1) and (index % 6 == 0)
						content << "<br /><br />"
			end
			content << %Q{
				<span class="tag">#{link_to tag.name, tourist_sight_tourist_sight_tags_path(tourist_sight, :tag_id => tag.id) }</span>
			}
		end
		
		return content
	end

end
















