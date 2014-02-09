<?

function p() {	
	$arrays = func_get_args();
	foreach($arrays as $array) {
		echo '<pre style="width:100%; float:left;">';
		print_r($array); 
		echo '</pre>';	
	}
}

function pd() {	
	$arrays = func_get_args();
	foreach($arrays as $array) {
		echo '<pre style="width:100%; float:left;">';
		print_r($array); 
		echo '</pre>';	
	}
	die;
}

function v() {	
	$arrays = func_get_args();
	foreach($arrays as $array) {
		echo '<pre style="width:100%; float:left;">';
		var_dump($array); 
		echo '</pre>';	
	}
}

function vd() {
	$arrays = func_get_args();
	foreach($arrays as $array) {
		echo '<pre style="width:100%; float:left;">';
		var_dump($array); 
		echo '</pre>';	
	}
	die;
}