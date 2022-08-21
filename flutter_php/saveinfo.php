<?php
include 'conn.php';

$sql = $connection->query("SELECT max(trano) FROM transacts");


$tra = array();

while($row=$sql->fetch_assoc()){
	
	$tra[]=$row;
	
}

$id = $tra[0]['max(trano)'] +1;

$date = $_POST['date'];

$vou = $_POST['vou'];
$tradet = $_POST['tradet'];
$project = $_POST['project'];
$curty = $_POST['curty'];
$docty = $_POST['docty'];
$curp = $_POST['curp'];

$now = date_create()->format('Y-m-d H:i:s');


$connection->query("INSERT INTO transacts (trano, TraDate, VouNo,BillId,CurP,TraDetails,currency,Project,UserNo,created_at,updated_at) VALUES 
('.$id.','$date' ,'.$vou.',  '.$docty.', '.$curp.', '$tradet', '.$curty.','.$project.' , '[value-6]', '$now', '$now')");

?>
