<div class ="row col-md-12">
    <div class ="col-md-8">

    <p>Naam event : <?php echo $this->event['name']; ?></p>
    <p>Startdatum : <?php echo $this->event['start_date']; ?></p>
    <p>Einddatum : <?php echo $this->event['end_date']; ?></p>
    <p>Toegangsprijs : <?php echo $this->event['price']; ?></p>
    <?php if ($this->locations->num_rows ==1 )
            echo ("<p> Locatie : ".$this->locations->row['name']." </p>");
          else { ?>
            <p>Locaties:
            <select name="location">
            <?php foreach($this->locations->rows as $k) { ?>
                <option value=""><?php echo $k['name'] ?></option>
            <?php } ?>
            </select> 
            </p>
        <?php } ?>
    <p>Optredens:
    <table class="table">
        <thead><tr><th>Title</th><th>Location</th><th>datum</th><th>tijd</th></tr></thead>
        <?php foreach($this->performances as $k) { ?>
            <tr><td><?php echo ($k['performance_title'])?></td><td><?php echo $k['location_name'] ?></td>
            <td><?php echo (date('D Y-m-d',strtotime($k['date_from']))) ?></td>
            <td> <?php echo (date('G:i',strtotime($k['date_from']))."-".date('G:i',strtotime($k['date_until']))) ?></td></tr>
        <?php } ?>
      </table>
    </p>
    </div>

    <div class="col-md-4" id="googleMap" style="width:300px;height:300px;"></div>
</div>

<script type="text/javascript">

$(document).ready(load());

function load() {
    // Load a new GeoCoder service
    geocoder = new google.maps.Geocoder();
    // Setup variables for a new map (google maps api)
    var latlng = new google.maps.LatLng(-122.3451, 47.6141);
    var mapOptions = {
        zoom: 6,
        center: latlng
    };
    // Load a new map
    map = new google.maps.Map(document.getElementById('googleMap'), mapOptions);
    //  Get XML back from database via a PHP file and process it    
    downloadUrl("./module/event/get_gmap_xml.php?event=<?php echo $_GET['event'];?>", function(data) {
        var xml = data.responseXML;
        var markers = xml.documentElement.getElementsByTagName("marker");
        // Loop through each marker which contains an address
        for (var i = 0; i < markers.length; i++) {
            var name = markers[i].getAttribute("name");
            var address = markers[i].getAttribute("address") ;
            // call geocoder service with address and get set marker on map with latlng from service
            geocoder.geocode( { 'address': address}, function(results, status) {
                if (status === google.maps.GeocoderStatus.OK) {
                    // set a a marker and set center of map to that latlng
                    map.setCenter(results[0].geometry.location);
                    var marker = new google.maps.Marker({
                      map: map,
                      position: results[0].geometry.location 
                    });
                } else {
                     alert('Geocode was not successful for the following reason: ' + status);
                    }
            });
        }
    });
}

function downloadUrl(url, callback) {
  var request = window.ActiveXObject ?
      new ActiveXObject('Microsoft.XMLHTTP') :
      new XMLHttpRequest;

  request.onreadystatechange = function() {
    if (request.readyState == 4) {
      request.onreadystatechange = doNothing;
      callback(request, request.status);
    }
  };

  request.open('GET', url, true);
  request.send(null);
}
    
function doNothing() {}
  </script>