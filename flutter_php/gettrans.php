<?php

include 'conn.php';
$X = $_GET['i'];


switch ($X) {
    case 0:
$sql = $connection->query("SELECT * FROM transacts");


$tra = array();

while($row=$sql->fetch_assoc()){
	
	$tra[]=$row;
	
}

echo json_encode($tra);        
break;
    case 1:
      $sql = $connection->query("SELECT * FROM doctypes");


$docty = array();

while($row=$sql->fetch_assoc()){
	
	$docty[]=$row;

}
echo json_encode($docty);        

        break;
    case 2:
  $sql = $connection->query("SELECT * FROM currencies");


$curty = array();

while($row=$sql->fetch_assoc()){
	
	$curty[]=$row;
	
}
echo json_encode($curty);        

        break;
		
		 case 3:
  $sql = $connection->query("SELECT * FROM projects");


$projects = array();

while($row=$sql->fetch_assoc()){
	
	$projects[]=$row;
	
}
echo json_encode($projects);        

        break;
}



?>