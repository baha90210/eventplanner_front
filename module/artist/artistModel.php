<?php
class artistModel extends Model{
	
	public function getArtists(){
		$sql = "SELECT * FROM artist ORDER BY name ASC";
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}
	
	
	
	public function getArtist($id){
		$sql = "SELECT * FROM artist WHERE artist_id = '".$id."'";

		$result = $this->db->query($sql);
		
		return $result->row;
	}


	

}
