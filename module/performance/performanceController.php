<?php
class performanceController extends Controller{
public function __construct(){
    //parent::__construct();

    $this->authorize();
    $this->addScript('//code.jquery.com/jquery-1.11.2.min.js');
    $this->addScript('//code.jquery.com/ui/1.11.2/jquery-ui.js');
    $this->addScript('./themes/sander/bootstrap-3.3.2-dist/js/bootstrap.min.js');
    
    $this->addStyle('//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css');
}

public function overview(){		
    $this->setHeaderMSG('Overzicht performances');
    
    $this->loadModel('performance');
    $this->performance = $this->model->getPerformances();

    $this->loadModel('event');
    $this->events = $this->model->getEvents();

    $this->loadModel('artist');
    $this->artists = $this->model->getArtists();

    $this->render('performance_overview.tpl');
}



}