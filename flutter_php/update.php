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
 
 
 echo $date;
 echo "//";
 echo $vou;
  echo "//";

 echo $tradet;
 echo "//";

 echo $project;
 echo "//";

 echo $curty;
 echo "//";

 echo $docty;


 $connection->query("UPDATE transacts SET TraDate='[value-6]',
VouNo='".$vou."',BillId= '".$docty."',CurP='".$curp."',TraDetails='".$tradet."',
currency='.$curty.',Project='$project',UserNo='[value-9]',created_at='[value-10]',
updated_at='[value-11]' WHERE trano = '".$updateId."';");



?>