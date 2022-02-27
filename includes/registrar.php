<?php 

require_once("conexion.php"); 

$errores = array();
	
	// Validación de formulario
	$campos_requeridos = array('sexo','edad','sexo_gusto','pareja','locacion');
	foreach($campos_requeridos as $nombre_de_campo) {
		if (!isset($_POST[$nombre_de_campo]) || empty($_POST[$nombre_de_campo])) {
			$errores[] = $nombre_de_campo;
		}}
	if (!empty($errores)) {
		header("location: ../index.php");
		echo "<p>Debe Llenar los campos del perfil</p>";
	}
?>
	<?php

    $sexo = $_POST['sexo'];
	$edad = $_POST['edad'];
	$sexo_gusto = $_POST['sexo_gusto'];
	$pareja = $_POST['pareja'];
	$locacion = $_POST['locacion'];
	$lit1 = $_POST['lit1'];
	$lit2 = $_POST['lit2'];
	$lit3 = $_POST['lit3'];
	$lit4 = $_POST['lit4'];
	$lit5 = $_POST['lit5'];
	$lit6 = $_POST['lit6'];
	$lit7 = $_POST['lit7'];
	$lit8 = $_POST['lit8'];
	$lit9 = $_POST['lit9'];
	$lit10 = $_POST['lit10'];
	$lit11 = $_POST['lit11'];
	$lit12 = $_POST['lit12'];
	$lit13 = $_POST['lit13'];
	$user = "u";
	$pass = "u";
	$email = "u";

	if($sexo!='0' && $sexo_gusto!='0' && $locacion!='0'){
	$query = 'INSERT INTO multi2_user (user, pass, email, sexo, edad, sexo_gusto, pareja, locacion, lit1,lit2,lit3,lit4,lit5,lit6,lit7,lit8,lit9,lit10,lit11,lit12,lit13) VALUES 
	(\''.$user.'\',\''.$pass.'\',\''.$email.'\',\''.$sexo.'\',\''.$edad.'\',\''.$sexo_gusto.'\',\''.$pareja.'\',\''.$locacion.'\',\''.$lit1.'\',\''.$lit2.'\',\''.$lit3.'\',\''.$lit4.'\',\''.$lit5.'\',\''.$lit6.'\',\''.$lit7.'\',\''.$lit8.'\',\''.$lit9.'\',\''.$lit10.'\',\''.$lit11.'\',\''.$lit12.'\',\''.$lit13.'\')';
	
	$result = mysqli_query($query, $db_conexion);

    }else{
    	 header("location:../index.php?uso=uno");
    }
	
	if(is_numeric($edad)){
    if($result){
        header("location:../index.php?uso=exl");
	}else{
		echo "<p>La creación del tema ha fallado.</p>";
		echo "<p>" . mysqli_error() . "</p>";
	}
    }else{
		echo "<p>Su edad debe ser un numero</p>";
		echo "<p>" . mysqli_error() . "</p>";
    }
?>

<?php mysqli_close($db_conexion); ?>