<?php
class resourceController extends Controller{
	public function overview(){
		$this->setTitle('Overzicht resources');
		
		$this->loadModel('resource');
		
		$this->resources = $this->model->getresources();
		
		$this->render('resource_overview.tpl');
	}

	

	
}