<?php
class locationModel extends Model{
    public function getLocations(){
            $sql = "SELECT * FROM location ORDER BY name ASC";
            $result = $this->db->query($sql);

            return $result->rows;
    }

    public function getLocation($id){
            $sql = "SELECT * FROM location WHERE location_id = '".$id."'";
            $result = $this->db->query($sql);

            return $result->row;
    }

    public function getLocationsByEvent($id){
            $sql  = "SELECT L.* FROM location as L ";
            $sql .= "INNER JOIN event_location as E ";
            $sql .= "WHERE L.location_id = E.location_id ";
            $sql .= "AND E.event_id = ".$id.";";
            $result = $this->db->query($sql);

            //echo $sql;
            return $result->rows;
    }
}