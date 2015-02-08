<?php

// Start XML file, create parent node

$dom = new DOMDocument("1.0");
$node = $dom->createElement("markers");
$parnode = $dom->appendChild($node);

// Setup a db connection
include '../../config.php';
require_once('../../system/library/db.php');
$db_connect = new Db();


// Select all the rows in the markers table

$query = "SELECT * FROM location ";
$query .= "INNER JOIN event_location as EL ON EL.location_id = location.location_id ";
$query .= "WHERE EL.event_id = ".$_GET['event'];
$result = $db_connect->query($query);
if (!$result) {
  die('Invalid query: ' . mysql_error());
}

header("Content-type: text/xml");

// Iterate through the rows, adding XML nodes for each

foreach ($result->rows as $row) {
  // ADD TO XML DOCUMENT NODE
  $node = $dom->createElement("marker");
  $newnode = $parnode->appendChild($node);
  $newnode->setAttribute("name",$row['name']);
  $str_adres = $row['land']." ".$row['address']." ".$row['postcode']." ".$row['plaats'];
  $newnode->setAttribute("address",$str_adres );
}

echo $dom->saveXML();

?>