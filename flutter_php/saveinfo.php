<?php

include 'conn.php';
 $date= $_POST['date'];
 $vou = $_POST['vou'];
 $tradet = $_POST['tradet'];
 $project= $_POST['prject'];
 $curty = $_POST['curty'];
 $docty = $_POST['docty'];
 
 
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
 
$connection->query("INSERT INTO transacts (trano, TraDate, VouNo,BillId,CurP,TraDetails,currency,Project,UserNo,created_at,updated_at) VALUES ('[value-3]', '".$date."','[value-2]',  '.$vou.', '".$date."', '[value-5]', '.$curty.','.$project.','[value-6]' , '[value-6]', '[value-6]')");
?>