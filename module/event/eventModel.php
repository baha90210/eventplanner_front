<?php
class eventModel extends Model{

	public function getEvents(){
		$sql = "SELECT * FROM event ORDER BY start_date ASC";
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}
	
	// Get the events and its locations and artists for a given month
	// public function getMonthEventDetails($month = null) {
	public function getAllEventDetails() {

		// $date = date_parse($month);

		// if (!$date['year'] or !$date['month']) {
		// 	// Given month is invalid, use today.
		// 	$date = date_parse(date('Y-m-d'));			
		// }

		// // First day of month
		// $month_start = $date['year']."-".$date['month']."-1";

		// // First day of next month
		// $date_next = $date;
		// if ($date_next['month'] == 12) {
		// 	$date_next['year']++;
		// 	$date_next['month'] = 1;
		// } else {
		// 	$date_next['month']++;
		// }

		// $month_end = $date_next['year']."-".$date_next['month']."-1";

		// If the query fails, execute this sql from git:
		// 1. _assets/events-performance.sql
		// 2. _assets/events-location-update.sql

		$sql = "SELECT *, 
			event.name AS event_name, 
			artist.name AS artist_name,
			location.name AS location_name
			FROM event
			INNER JOIN performance ON event.event_id = performance.event_id
			INNER JOIN artist ON artist.artist_id = performance.artist_id
			INNER JOIN location ON location.location_id = performance.location_id
			-- WHERE event.start_date >= '{month_start}' 
			-- AND event.start_date < '{month_end}'
			ORDER BY event.start_date ASC, performance.date_from ASC";
		
		$result = $this->db->query($sql);
		
		// Put results into structured array
		$output = array();

		foreach ($result->rows as $row) {

			$output[ $row['event_id'] ]['name']       = $row['event_name'];
			$output[ $row['event_id'] ]['price']      = $row['price'];
			$output[ $row['event_id'] ]['start_date'] = $row['start_date'];
			$output[ $row['event_id'] ]['end_date']   = $row['end_date'];

			$output[ $row['event_id'] ]['artists'][ $row['artist_id'] ] = array(
				'name'    => $row['artist_name'],
				'website' => $row['website'],
				'image'   => $row['image']
			);

			$output[ $row['event_id'] ]['locations'][ $row['location_id'] ] = array(
				'name'     => $row['location_name'],
				'address'  => $row['address'],
				'capacity' => $row['capacity']
			);

			$output[ $row['event_id'] ]['performances'][ $row['location_id'] ] = array(
				'artist_name'       => $row['artist_name'],
				'artist_website'    => $row['website'],
				'artist_image'      => $row['image'],
				'location_name'     => $row['location_name'],
				'location_address'  => $row['address'],
				'location_capacity' => $row['capacity'],
				'title'             => $row['performance_title'],
				'date_from'         => $row['date_from'],
				'date_until'        => $row['date_until']
			);

		}

		return $output;
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