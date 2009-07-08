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

end
















