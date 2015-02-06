<?php
class eventController extends Controller{


public function overview(){		
    $this->addScript('//code.jquery.com/jquery-1.11.2.min.js');
    $this->addScript('https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js');
    $this->addStyle('https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css');
    
    $this->loadModel('event');

    $events = $this->model->getEvents();

    $this->events = array();

}


// Opdracht Sander
public function eventdetails(){		
    
    $this->addScript('//code.jquery.com/jquery-1.11.2.min.js');
    $this->addScript('https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js');
    $this->addStyle('https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css');
    
    $id = filter_input(INPUT_GET, 'event', FILTER_SANITIZE_NUMBER_INT);
    
    // haal gegevens event op
    $this->loadModel('event');
    $this->event = $this->model->getEvent($id);
    
    // haal locaties van event op
    $this->loadModel('location');
    $this->locations = $this->model->getLocationsByEvent($id);
    
    // haal locaties van event op
    $this->loadModel('performance');
    $this->performances = $this->model->getperformancesByEvent($id);  
    // render het template
    $this->render('front_eventdetails.tpl');
}

}