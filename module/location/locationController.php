<?php
class locationController extends Controller{
	public function overview(){
		$this->setTitle('Overzicht locaties');
		
		$this->loadModel('location');
		
		$this->locations = $this->model->getLocations();
		
		$this->render('location_overview.tpl');
	}

	
}