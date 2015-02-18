<?php
class artistController extends Controller{


	public function overview(){		
		$this->setTitle('Overzicht artists');
		
		$this->loadModel('artist');		
		$this->artists = $this->model->getArtists();		
		$this->render('artist_overview.tpl');
	}


	public function profile(){		
		$this->setTitle('Artist profile');
		
		if(isset($_GET['id'])){
			$this->loadModel('artist');		
			$this->artist = $this->model->getArtist($_GET['id']);		
			$this->render('artist_profile.tpl');
		}
		else {
			$this->msg = 'Artiest niet gevonden';	
			$this->render('artist_profile.tpl');
		}
	}

	
	public function getInfo(){
		$this->loadModel('artist');
		
		$result = $this->model->getArtist($_GET['artist_id']);
		
		echo json_encode($result);
	}
        
	public function details(){		
		$this->setTitle('Artist profile');
		
		if(isset($_GET['id'])){
			$this->loadModel('artist');		
			$this->artist = $this->model->getArtist($_GET['id']);		
			$this->render('front_artistdetails.tpl');
		}
	}
}