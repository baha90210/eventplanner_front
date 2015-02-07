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

<script>
var myCenter=new google.maps.LatLng(51.508742,-0.120850);
function initialize() {
  var mapProp = {
    center: myCenter,
    zoom:5,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
  var marker=new google.maps.Marker({
    position: myCenter,
  });
  marker.setMap(map);
}
google.maps.event.addDomListener(window, 'load', initialize);
</script>    