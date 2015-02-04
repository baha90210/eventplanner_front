<?php
class eventController extends Controller{


	public function overview(){		
		$this->setTitle('Overzicht events');
		$this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');
		
		$this->loadModel('event');
		
		$events = $this->model->getEvents();

		$this->events = array();
		
        foreach($events as $event){
	        //get event locations
	        $event['locations'] = array();
	        $event_locations = $this->model->baha_getEventLocation($event['event_id']);
	        
	        foreach($event_locations as $location){
		        $event['locations'][] = $location;
	        }

	        //get event resources
	        $event['resources'] = array();
	        $event_resources = $this->model->baha_getEventResources($event['event_id']);
	        //var_dump($event_resources);
	        foreach($event_resources as $resource){
		        $event['resources'][] = $resource;
	        }
	        
	        $this->events[] = $event;
		}		

		$this->render('event_overview.tpl');
	}

	
}