<!DOCTYPE html>
<html>
<head>
	<title><?php echo $this->title; ?></title>
	<?php 
		foreach($this->scripts as $script){
			echo $script;
		}
	?>
	<?php 
		foreach($this->styles as $style){
			echo $style;
		}
	?>
</head>