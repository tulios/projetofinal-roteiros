// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function collapse_box(arrow1_id, arrow2_id, content_id){
	if ($('#'+arrow1_id).css("display") == "none"){
		$('#'+arrow1_id).show();
		$('#'+arrow2_id).hide();
		$('#'+content_id).slideUp();
	}
	else{
		$('#'+arrow2_id).show();
		$('#'+arrow1_id).hide();
		$('#'+content_id).slideDown();
	}
}

function keep_value(text, id){
	if ($('#'+id).attr('value') == null || $('#'+id).attr('value').length == 0){ 
		$('#'+id).attr('value',text);

	}else if ($('#'+id).attr('value') == text){
		$('#'+id).attr('value','');
	};
}
