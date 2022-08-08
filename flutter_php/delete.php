<?php
include 'conn.php';
$deletId = $_GET['id'];

$sql = $connection->query("DELETE  FROM transacts WHERE trano = $deletId");





?>