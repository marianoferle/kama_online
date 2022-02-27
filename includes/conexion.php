<?php
require_once('constantes.php');

$db_conexion = mysqli_connect(DB_SERVER, DB_USER, DB_PASS);
//$db_conexion = new mysqli(DB_SERVER, DB_NAME, DB_PASS);

if(!$db_conexion){
	die("La conexion a la base de datos ha fallado: " . mysql_error());
}

//$db_seleccion = mysql_select_db($db_conexion,DB_NAME);
mysqli_select_db($db_conexion, DB_NAME) or die(mysqli_error($db_conexion));

?>