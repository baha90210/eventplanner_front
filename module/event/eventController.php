<?php
class eventController extends Controller{


public function overview(){		
    $this->setTitle('Overzicht events');
    $this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');

    $this->loadModel('event');

    $events = $this->model->getEvents();

    $this->events = array();

}

public function eventdetails(){		
    
    $this->setTitle('Overzicht events');
    $this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');

    $this->loadModel('event');
    
    $id = filter_input(INPUT_GET, 'event', FILTER_SANITIZE_NUMBER_INT);
    $this->event = $this->model->getEvent($id);
    
    $this->render('front_event_details.tpl');
}

}