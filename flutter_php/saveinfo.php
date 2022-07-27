<?php

include 'conn.php';
$x = $_GET['date'];
$c = $_GET['vou'];
echo $x;
echo $c;
//
//$mysqli->query("INSERT INTO transacts (trano, TraDate, VouNo,BillId,CurP,TraDetails,currency,Project,UserNo,created_at,updated_at) VALUES ('[value-1]', '[value-2]', '".$date."', '".$vou."', '[value-5]', '[value-6]','".$curty."', '".$project."', '[value-2]', '[value-2]')");
?>