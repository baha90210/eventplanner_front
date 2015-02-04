<?php
class eventModel extends Model{
	public function getEvents(){
		$sql = "SELECT * FROM event ORDER BY start_date ASC";
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}
	
	
	
	public function getEvent($id){
		$sql = "SELECT * FROM event WHERE event_id = '".$id."'";
		
		$result = $this->db->query($sql);
		
		return $result->row;
	}

	public function getEventLocations($id){
		$sql = "SELECT * FROM event_location WHERE event_id = '".$id."'";
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}
	
        public function getEventResources($id){
		$sql = "SELECT resource_id FROM event_resource WHERE event_id = '".$id."'";
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}

	
	
	public function baha_getEventLocation($event_id){
		$sql  = "SELECT l.* FROM event_location el ";
		$sql .= "LEFT JOIN location l ON el.location_id = l.location_id ";
		$sql .= "WHERE event_id = '".$event_id."'";

		$result = $this->db->query($sql);
		
		return $result->rows;
	}

	public function baha_getEventResources($event_id){
		$sql  = "SELECT r.*, rt.name type_name FROM event_resource er ";
		$sql .= "LEFT JOIN resource r ON er.resource_id = r.resource_id ";
		$sql .= "LEFT JOIN resource_type rt ON rt.resource_type_id = r.type ";
		$sql .= "WHERE event_id = '".$event_id."'";

		$result = $this->db->query($sql);
		
		return $result->rows;
	}














}