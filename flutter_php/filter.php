<?php
function filterReqest($request){
	
	
	
	return htmlspecialchars(strip_tags($_POST[$request]));
	
	
	
	
	
	
	
}




?>