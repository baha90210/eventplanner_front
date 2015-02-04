<?php
class resourceModel extends Model{
	public function getresources(){
		$sql = "SELECT * FROM resource";
	
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}
	
	
	public function getresource($id){
		$sql = "SELECT * FROM resource WHERE resource_id = '".$id."'";
		
		$result = $this->db->query($sql);
		
		return $result->row;
	}
	
	
}