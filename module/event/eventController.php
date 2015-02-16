<?php
class eventController extends Controller{
// opdracht bxckooy
public function __construct(){
		$this->language = new language;
                
                $this->language->load('event');
		$this->label_event_name = $this->language->get('label_event_name');
		$this->label_event_startdatum = $this->language->get('label_event_startdatum');
		$this->label_event_einddatum = $this->language->get('label_event_einddatum');
		$this->label_event_prijs = $this->language->get('label_event_prijs');
}
// Opdracht Alexander
public function index() {

    // Add needed scripts
    $this->addScript('//code.jquery.com/jquery-1.11.2.min.js');
    $this->addScript('https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js');
    $this->addStyle('https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css');
    
    // Get information about the events
    $this->loadModel('event');

    $events = $this->model->getMonthEventDetails(isset($_GET['month']) ? $_GET['month'] : null);

    $this->events = $events;
    $this->events_json = json_encode($events);

    $this->render('event_index.tpl');

}


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
    $this->addScript('https://maps.googleapis.com/maps/api/js?v=3.exp');
    
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