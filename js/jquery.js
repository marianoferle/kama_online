var v_largo;
var v_alto;

var wind;
var win2;
var win3;
var hind;
var hin2;

var sex1=false;
var sex2=false;
var edad1=1;
var edad2=8;
var ed;
var gusto1=false;
var gusto2=false;
var gusto3=false;
var pareja1=false;
var pareja2=false;

var mapa=false;
var sexo=false;
var gusto=false;
var pareja=false;


//$('#fondo_blanco').css({'display':'block'}).delay(500).fadeOut(500); 

//READY+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$(document).ready(function() {
  acomodar();

$('#inde_x').fadeOut(10000);

var vl;
var va;

$("select").change(function () {
var locc="";
$('#locc option:selected').each(function () {  locc += $(this).text(); mapa=true; });

if(locc=='Argentina'){ $('#point').css({'top':'265px','left':'85px'}); }
if(locc=='Bolivia'){ $('#point').css({'top':'165px','left':'90px'}); }
if(locc=='Brasil'){ $('#point').css({'top':'140px','left':'160px'}); }
if(locc=='Colombia'){ $('#point').css({'top':'45px','left':'45px'}); }
if(locc=='Chile'){ $('#point').css({'top':'260px','left':'53px'}); }
if(locc=='Paraguay'){ $('#point').css({'top':'202px','left':'120px'}); }
if(locc=='Peru'){ $('#point').css({'top':'125px','left':'35px'}); }
if(locc=='Uruguay'){ $('#point').css({'top':'255px','left':'125px'}); }
if(locc=='Venezuela'){ $('#point').css({'top':'30px','left':'90px'}); }
});


$('#kama_log2').click(function(){ form1(); });

$('body').hover(function(){ 
  vl=$(window).width();
  va=$(window).height();
    if(vl!=v_largo || va!=v_alto){ acomodar(); }
});

$('#exi_inde').click(function(){$('#inde_x').fadeOut(500); });
$('#loggins').click(function(){$('#inde_x').fadeIn(); form1(); });


$('#sig_1').click(function(){ac();$('#form_index').css({'display':'none'});$('#form_pais').fadeIn();});
$('#sig_2').click(function(){if(mapa==true){ac();$('#form_pais').css({'display':'none'});$('#form_sexo').fadeIn();} });
$('#sig_3').click(function(){if(sexo==true){ac();$('#form_sexo').css({'display':'none'});$('#form_edad').fadeIn(); if(sex2==true){edad_col();gusto_col();}}   });
$('#sig_4').click(function(){ac();$('#form_edad').css({'display':'none'});$('#form_gusto').fadeIn(); ed=10*edad1+edad2; $('#edad_inp').val(ed);       });
$('#sig_5').click(function(){if(gusto==true){ ac();$('#form_gusto').css({'display':'none'});$('#form_pareja').fadeIn(); pareja_col();}    });
$('#sig_6').click(function(){if(pareja==true){ ac();$('#form_pareja').css({'display':'none'});$('#form_poses').fadeIn();}     });




$('#sex_bot1').click(function(){$('#s_ex').click();sex1=true;sex2=false;sex_sex();});
$('#sex_bot2').click(function(){$('#s_ex2').click();sex2=true;sex1=false;sex_sex();});

$('#edad_bot1').click(function(){if(edad1<=9 && edad2<=9){
 if(edad2<9){edad2++;
     $('#edad_n2').html(edad2);
 }else if(edad2==9){
     edad1++;edad2=0;$('#edad_n1').html(edad1);$('#edad_n2').html(edad2);
  }}
});

$('#edad_bot2').click(function(){if(edad1>=2){
  if(edad2>0){
      edad2--;$('#edad_n2').html(edad2);
  }else if(edad2==0){
     edad1--;edad2=9;$('#edad_n1').html(edad1);$('#edad_n2').html(edad2);
  }}

});

$('#gusto_bot1').click(function(){$('#g_usto1').click();gusto1=true;gusto2=false;gusto3=false;gusto_gusto();});
$('#gusto_bot2').click(function(){$('#g_usto2').click();gusto1=false;gusto2=true;gusto3=false;gusto_gusto();});
$('#gusto_bot3').click(function(){$('#g_usto3').click();gusto1=false;gusto2=false;gusto3=true;gusto_gusto();});

$('#pareja_bot1').click(function(){$('#p_areja1').click();pareja1=true;pareja2=false;pareja_pareja();});
$('#pareja_bot2').click(function(){$('#p_areja2').click();pareja1=false;pareja2=true;pareja_pareja();});



}); //READY+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function edad_col(){
  $('#edad_num').css('background-image','url(images/edad_m.png)');
  $('#edad_bot1').css('background-image','url(images/mas_m.png)');
  $('#edad_bot2').css('background-image','url(images/menos_m.png)');
}

function gusto_col(){
  $('#gusto_bot2').css('background-image','url(images/ico_bi_m.png)');
  $('#gusto_bot3').css('background-image','url(images/ico_homo_m.jpg)'); //-----jpg
}

function pareja_col(){
  if(sex1==true){
    if(gusto3==true){
      $('#pareja_bot1').css('background-image','url(images/pareja_homo_h.png)');
    }
      $('#pareja_bot2').css('background-image','url(images/soltero_h.png)');
  }else if(sex2==true){
     if(gusto3==true){
      $('#pareja_bot1').css('background-image','url(images/pareja_homo_m.jpg)'); //-----jpg
    }
      $('#pareja_bot2').css('background-image','url(images/soltero_m.png)');
  }
}

function ac(){
  $('#fondo_blanco').css({'display':'block'}).delay(1000).fadeOut(800); 
}

function sex_sex(){
  sexo=true;
  if(sex1==true){
   $('#sex_bot1').css({'opacity':'1.0'});
   $('#sex_bot2').css({'opacity':'0.5'});
  }else if(sex2==true){
  $('#sex_bot2').css({'opacity':'1.0'});
  $('#sex_bot1').css({'opacity':'0.5'});
  }
}


function gusto_gusto(){
  gusto=true;
  if(gusto1==true){
   $('#gusto_bot1').css({'opacity':'1.0'});
   $('#gusto_bot2').css({'opacity':'0.5'});
   $('#gusto_bot3').css({'opacity':'0.5'});
  }else if(gusto2==true){
   $('#gusto_bot1').css({'opacity':'0.5'});
   $('#gusto_bot2').css({'opacity':'1.0'});
   $('#gusto_bot3').css({'opacity':'0.5'});
  }else if(gusto3==true){
   $('#gusto_bot1').css({'opacity':'0.5'});
   $('#gusto_bot2').css({'opacity':'0.5'});
   $('#gusto_bot3').css({'opacity':'1.0'});
  }
}

function pareja_pareja(){
  pareja=true;
  if(pareja1==true){
   $('#pareja_bot1').css({'opacity':'1.0'});
   $('#pareja_bot2').css({'opacity':'0.5'});
  }else if(pareja2==true){
   $('#pareja_bot2').css({'opacity':'1.0'});
   $('#pareja_bot1').css({'opacity':'0.5'});
  
  }
}

function form1(){ 
    $('.form_partes').css({'display':'none'}); 
    $('#form_index').fadeIn(); 
}

function acomodar(){
v_largo = $(window).width();
v_alto = $(window).height();

wind=v_largo-1000;
win2=wind/2;
win3=win2+1000;
hind=v_alto-600;
hin2=hind/2;

if(v_largo>1000){
    $('#contenedor').animate({'left':win2},500);
    $('#inde_x2').animate({'left':win2},500);
}else if(v_largo<1000){
    $('#contenedor').animate({'left':0},500);
    $('#inde_x2').animate({'left':0},500);
}
if(v_alto>600){
    $('#contenedor').animate({'top':hin2});
    $('#inde_x2').animate({'top':hin2});
}else if(v_alto<600){
    $('#contenedor').animate({'top':0},500);
    $('#inde_x2').animate({'top':0},500);
}

}