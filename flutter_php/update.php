<?php
include 'conn.php';
$updateId = $_GET['id'];

 $date= $_POST['date'];
 $vou = $_POST['vou'];
 $tradet = $_POST['tradet'];
 $project= $_POST['project'];
 $curty = $_POST['curty'];
 $docty = $_POST['docty'];
 $curp = $_POST['curp'];
 

$now = date_create()->format('Y-m-d H:i:s');

 $connection->query("UPDATE transacts SET TraDate='$date',
VouNo='".$vou."',BillId= '".$docty."',CurP='".$curp."',TraDetails='".$tradet."',
currency='.$curty.',Project='$project',UserNo='[value-9]',
updated_at='$now' WHERE trano = '".$updateId."';");



?>