
</div>

<div id="inde_x">
<div id="inde_x2">
<div id="autores"><a target="_blank" href="http://marianoferle.com.ar/">Mariano Ferle |</a><a target="_blank" href="http://lanoelstudio.com/">| Marcelo Lano&euml;l</a></div>

<div id="form_index" class="form_partes">
<div id="form_index"><div id="kama_log"><div id="slogan">Visualizaci&oacute;n de nuestra identidad sexual</div></div></div>
<div id="sig_1" class="sig"></div>
</div>

<form action="includes/registrar.php" method="POST">




<div id="form_pais" class="form_partes">
<div class="kama_log2"></div>
<div id="local_mapa"><div id="point"></div></div>
<div id="local_tit">¿D&oacute;nde vives?</br></br>
<select id="locc" name="locacion"> 
       <option  value="0" selected="selected">-</option>
       <option  value="Argentina">Argentina</option> 
       <option  value="Bolivia">Bolivia</option> 
       <option  value="Brasil">Brasil</option> 
       <option  value="Colombia">Colombia</option> 
       <option  value="Chile">Chile</option> 
       <option  value="Paraguay">Paraguay</option> 
       <option  value="Peru">Peru</option> 
       <option  value="Uruguay">Uruguay</option> 
       <option  value="Venezuela">Venezuela</option> 
</select>
</div>
<div id="sig_2" class="sig"></div>
</div>



<div id="form_sexo" class="form_partes">
  <div class="kama_log2"></div>
  <div id="sex_bots">
      <div id="sex_bot1"></div><div id="sex_bot2"></div>
      <input id="s_ex" type="radio" name="sexo"  value="1"><input id="s_ex2" type="radio" name="sexo" value="2">
      <div id="sex_cli1"></div><div id="sex_cli2"></div>
  </div>
    <div id="sex_tit">¿Sexo?</div>
<div id="sig_3" class="sig"></div>
</div>



<div id="form_edad" class="form_partes">
  <div class="kama_log2"></div>
  <div id="edad_to">
  <input id="edad_inp" type="text" name="edad">
  <div id="edad_num"><div id="edad_n1">1</div><div id="edad_n2">8</div></div>
  <div id="edad_bots"><div id="edad_bot1"></div><div id="edad_bot2"></div></div>
</div>
<div id="edad_tit">¿Edad?</div>
<div id="sig_4" class="sig"></div>
</div>



<div id="form_gusto" class="form_partes">
<div class="kama_log2"></div>
<div id="gusto_to">
<ul>
<li><input id="g_usto1" type="radio" name="sexo_gusto" value="1"><div id="gusto_bot1"></div><div id="gusto_cli1"></div></li>
<li><input id="g_usto2" type="radio" name="sexo_gusto" value="2"><div id="gusto_bot2"></div><div id="gusto_cli2"></div></li>
<li><input id="g_usto3" type="radio" name="sexo_gusto" value="3"><div id="gusto_bot3"></div><div id="gusto_cli3"></div></li>
</ul>
</div>
<div id="gusto_tit">¿Preferencia Sexual?</div>
<div id="sig_5" class="sig"></div>
</div>



<div id="form_pareja" class="form_partes">
<div class="kama_log2"></div>
<ul>
<li><input id="p_areja1" type="radio" name="pareja" value="1"><div id="pareja_bot1"></div><div id="pareja_cli1"></div></li>
<li><input id="p_areja2" type="radio" name="pareja" value="0"><div id="pareja_bot2"></div><div id="pareja_cli2"></div></li>
</ul>
<div id="pareja_tit">¿Pareja?</div>
<div id="sig_6" class="sig"></div>
</div>



<div id="form_poses" class="form_partes">
<div class="kama_log2"></div>
<div id="poses_to">
<div id="poses_tit">¿Cuales te gustan?</div>
<div id="poses_list">
<div class="sex1_check"><img src="images/kama/4.png"/><input class="check" type="checkbox" name="lit1" value="1"></div>
<div class="sex1_check"><img src="images/kama/69.png"/><input class="check" type="checkbox" name="lit2" value="1"></div>
<div class="sex1_check"><img src="images/kama/abrazo.png"/><input class="check" type="checkbox" name="lit3" value="1"></div>
<div class="sex1_check"><img src="images/kama/boca_abajo.png"/><input class="check" type="checkbox" name="lit4" value="1"></div>
<div class="sex1_check"><img src="images/kama/cabalgada_espalda.png"/><input class="check" type="checkbox" name="lit5" value="1"></div>
<div class="sex1_check"><img src="images/kama/fusion.png"/><input class="check" type="checkbox" name="lit6" value="1"></div>
<div class="sex1_check"><img src="images/kama/guarda_espalda.png"/><input class="check" type="checkbox" name="lit7" value="1"></div>
<div class="sex1_check"><img src="images/kama/jinete.png"/><input class="check" type="checkbox" name="lit8" value="1"></div>
<div class="sex1_check"><img src="images/kama/la_flautita.png"/><input class="check" type="checkbox" name="lit9" value="1"></div>
<div class="sex1_check"><img src="images/kama/misionero.png"/><input class="check" type="checkbox" name="lit10" value="1"></div>
<div class="sex1_check"><img src="images/kama/mitad_mas_uno.png"/><input class="check" type="checkbox" name="lit11" value="1"></div>
<div class="sex1_check"><img src="images/kama/perrito.png"/><input class="check" type="checkbox" name="lit12" value="1"></div>
<div class="sex1_check"><img src="images/kama/sorbete.png"/><input class="check" type="checkbox" name="lit13" value="1"></div>
</div>
<input type="submit" class="boton_regis" value=""/>
</div>

</div>
</form>


<div id="titulo_log"> 
<?php
if(!empty($_GET)){
if( $_GET['uso']=="exl"){ echo "<script> $('#inde_x').css({'display':'none'}); </script> " ;}
if( $_GET['uso']=="uno"){ echo "Debe responder todas las preguntas" ;}
}
?>
</div>


</div>
<div id="exi_inde">ir a Visualizaci&oacute;n</div>
</div>

<div id="loggins">Inicio</div>

<div id="fondo_blanco"><div id="giff"></div></div>

</body>   
</html>

<?php
echo "<div id='conex'>";
if (isset($db_conexion)) {
  mysqli_close($db_conexion);
}
echo "</div>";
?>
