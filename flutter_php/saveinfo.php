<?php

include 'conn.php';
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
 
$connection->query("INSERT INTO transacts (trano, TraDate, VouNo,BillId,CurP,TraDetails,currency,Project,UserNo,created_at,updated_at) VALUES 
('[value-3]','[value-3]' ,'.$vou.',  '.$docty.', '.$curp.', '.$tradet.', '.$curty.','.$project.' , '[value-6]', '[value-6]', '[value-6]')");
?>