<div class ="row col-md-12">
    <div class ="col-md-8">

    <p><?php echo $this->label_event_name; ?> : <?php echo $this->event['name']; ?></p>
    <p><?php echo $this->label_event_startdatum; ?> : <?php echo $this->event['start_date']; ?></p>
    <p>Einddatum : <?php echo $this->event['end_date']; ?></p>
    <p>Toegangsprijs : <?php echo $this->event['price']; ?></p>
    <?php if ($this->locations->num_rows ==1 )
            echo ("<p> Locatie : ".$this->locations->row['name']." </p>");
          else { ?>
            <p>Locaties:
            <select name="loc" onchange="SelectRows()">
            <?php foreach($this->locations->rows as $k) { ?>
                <option value="<?php echo str_replace(' ','_',$k['name']) ?>"><?php echo $k['name'] ?></option>
            <?php } ?>
            </select> 
            </p>
        <?php } ?>
    <p>Optredens:
    <table class="table">
        <thead><tr><th>Title</th><th>Locatie</th><th>Datum</th><th>Tijd(en)</th><th></th></tr></thead>
        <?php foreach($this->performances as $k) { ?>
            <tr class="rij loc_<?php echo str_replace(' ','_',$k['location_name']) ?>"><td><?php echo ($k['performance_title'])?></td><td><?php echo $k['location_name'] ?></td>
            <td><?php echo (date('D Y-m-d',strtotime($k['date_from']))) ?></td>
            <td> <?php echo (date('G:i',strtotime($k['date_from']))."-".date('G:i',strtotime($k['date_until']))) ?></td>
            <td><a href='index.php?route=artist/details&id=<?php echo $k['artist_id'] ?>'> <span class="glyphicon glyphicon-info-sign"></span></a></td></tr>
        <?php } ?>
      </table>
    </p>
    </div>

    <div class="col-md-4" id="googleMap" style="width:300px;height:300px;"></div>
</div>

<script type="text/javascript">

function SelectRows(){
    // Verberg alles
    $('.rij').hide();
    loc = $('select[name="loc"]').val();
    // Bepaal welke regels getoond moeten worden
    selector = '.rij'; // Begin met alles
    if (loc) { selector += '.loc_'+loc.replace(" ","_"); } 
    $(selector).show(); // Toon deze rijen.
}

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