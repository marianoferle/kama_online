<?php

require_once('includes/conexion.php'); 

$db_tabla = "multi2_user";


if (isset($_GET['tipo'])) {  
  $tipo = $_GET['tipo'];
} else {
  $tipo = "null";
}

//----------------usuario3-------------------------

 if($tipo == "cargar"){ 
  $query = "SELECT * FROM ".$db_tabla.";";
  $db_resultado = mysqli_query($db_conexion,$query);

  if(!$db_resultado){
    die("La consulta a la base de datos ha fallado: " . mysqli_error());
  }else{

  $num_filas = mysqli_num_rows($db_resultado);
  if($num_filas == 0){ 
      return ""; 
  }else{ 
      while($fila = mysqli_fetch_array($db_resultado)){
           echo
           $fila[0] .",".  //id          
           $fila[1] .",".  //user
           $fila[4] .",".  //sexo
           $fila[5] .",".  //lit1
           $fila[6] .",".  //lit2
           $fila[7] .",".  //lit3
           $fila[8] .",".  //lit4
           $fila[9] .",".  //lit5
           $fila[10] .",". //lit6
           $fila[11] .",". //lit7
           $fila[12] .",". //lit8
           $fila[13] .",". //lit9
           $fila[14] .",".  //lit10
           $fila[15] .",".  //lit11
           $fila[16] .",".  //lit12
           $fila[17] .",".  //lit13
           $fila[18] .",".  //edad
           $fila[19] .",".  //sexo_gusto
           $fila[20] .",".  //pareja
           $fila[21]        //locacion
           ."\n";  
    }
   }
  }
}else{ 
  echo "Sólo funciona con tipo=cargar,2,3,tipo=salvar,tipo=limpiar"; 
}

mysqli_close($db_conexion);

?>