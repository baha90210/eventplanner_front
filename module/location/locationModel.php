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
}