<?php
 // echo $this->label_event_name;
 // echo $this->label_event_startdatum;
 // echo $this->label_event_einddatum;
 // echo $this->label_event_prijs;
?>

<div id="calendar" class="col-lg-7 col-md-12"></div>
<div class="col-lg-5 col-md-12">
	<div id="map" style="margin-top: 30px; height: 450px; background-color: #ccc;"></div>
</div>

<script>
	var events_obj = JSON.parse('<?php echo str_replace("'","\'", $this->events_json); ?>');

	var calendar_items = [];
	var maps_items = [];

	$.each(events_obj, function( index, value ) {
		calendar_items.push({
			title: value.name,
			start: value.start_date,
			end: value.end_date,
			url: 'index.php?route=event/eventdetails&event='+index
		});

		// console.log(value.locations);

		$.each(value.locations, function( id, location ) {
			// console.log(location);
			maps_items.push({
				name: location.name,
				address: location.address,
				city: location.city,
				start: value.start_date,
				event_name: value.name,
				event_id: index
			});
		});
	});

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

		$('#calendar').fullCalendar('gotoDate', calendar_items[0].start);
		
		// Load a new GeoCoder service
		geocoder = new google.maps.Geocoder();
		// Setup variables for a new map (google maps api)
		var latlng = new google.maps.LatLng(52.25, 5.25);
		var mapOptions = {
				zoom: 7,
				center: latlng
		};

		// Load a new map
		map = new google.maps.Map(document.getElementById('map'), mapOptions);

		//  Get XML back from database via a PHP file and process it    
		$.each(maps_items, function( idx, item ) {
			geocoder.geocode( { 'address': item.address + ' ' + item.city}, function(results, status) {
				if (status === google.maps.GeocoderStatus.OK) {
					map.setCenter(latlng);
					// set a a marker and set center of map to that latlng

					var start = moment(item.start, 'YYYY-MM-DD HH:mm:ss', 'nl');

					item_content = '<h4><em>' + item.event_name + '</em></h4>';
					item_content += '<h5>' + item.name + '</h5>';
					item_content += '<p>' + item.address + ', ' + item.city + '<br />';
					item_content += start.format('D MMMM YYYY') + '<br />';
					item_content += '<a href="index.php?route=event/eventdetails&event='+item.event_id+'">Details</a></p>';

				  var infowindow = new google.maps.InfoWindow({
				      content: item_content
				  });

				  var marker = new google.maps.Marker({
				      position: results[0].geometry.location,
				      map: map,
				      title: item.event_name
				  });

				  google.maps.event.addListener(marker, 'click', function() {
				    infowindow.open(map,marker);
				  });

				} else {
					console.log('Geocode was not successful for '+item.address + ' ' + item.city+'. Message: ' + status);
				}
			});
		}); // each map item
	}); // docready
</script>