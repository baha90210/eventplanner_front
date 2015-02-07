<?php
class performanceModel extends Model{
	
public function getPerformances()
{
    $sql = "SELECT performance_id, performance_title, t1.event_id, event.name AS eventname, artist.artist_id artist_id, artist.name AS artistname, t1.date_from, t1.date_until, confirmed ";
    $sql .= "FROM performance AS t1 ";
    $sql .= "INNER JOIN artist ON artist.artist_id = t1.artist_id ";
    $sql .= "INNER JOIN event ON event.event_id = t1.event_id ";
    if (isset($_GET['event']) && $_GET['event']!=='') $sql .= "WHERE t1.event_id='".$_GET['event']."' ";
    if (isset($_GET['artist']) && $_GET['artist']!=='') $sql .= "WHERE t1.artist_id='".$_GET['artist']."' ";
    $sql .= "ORDER BY date_from ASC";

    $result = $this->db->query($sql);

    return $result->rows;
}
	
public function getPerformance($id)
{
    $sql = "SELECT * FROM performance WHERE performance_id = '".$id."'";
    $result = $this->db->query($sql);

    return $result->row;
}

public function getPerformancesByEvent($event)
{
    $sql = "SELECT performance_id, performance_title, t1.event_id, artist.artist_id artist_id, artist.name AS artistname, location.name as location_name, t1.date_from, t1.date_until, confirmed ";
    $sql .= "FROM performance AS t1 ";
    $sql .= "INNER JOIN artist ON artist.artist_id = t1.artist_id ";
    $sql .= "INNER JOIN location ON location.location_id = t1.location_id ";
    $sql .= "WHERE t1.event_id=".$event."   ";
    $sql .= "ORDER BY date_from ASC";
    //echo $sql;
    $result = $this->db->query($sql);

    return $result->rows;
}

}