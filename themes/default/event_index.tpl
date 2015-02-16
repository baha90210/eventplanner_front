<?php
	// var_dump($this->events);
	// var_dump($this->events_json);
?>

<div id="calendar"></div>

<script>

var events_obj = JSON.parse('<?php echo str_replace("'","\'", $this->events_json); ?>');

var calendar_items = [];

$.each(events_obj, function( index, value ) {
	calendar_items.push({
		title: value.name,
		start: value.start_date,
		end: value.end_date,
		url: 'index.php?route=event/eventdetails&event='+index
	});
});

console.log(events_obj);
console.log(calendar_items);

$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next',
				center: 'title',
				right: ''
			},
			lang: 'nl',
			defaultView: 'month',
			timeFormat: 'H:mm',
			events: calendar_items
		});
		
		window.setTimeout( function() { $('#calendar').fullCalendar('render') }, 100);
		
	});
</script>