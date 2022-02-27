<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>KAMA</title>

    <script src="js/jquery-1.6.2.min.js"></script>
    <script src="js/jquery.spritely-0.1.js"></script>
    <link href="css/estilos.css" media="all" rel="stylesheet" type="text/css" />
    <script src="js/jquery.js"></script>
    <script src="js/processing.js"></script>
    <script type="text/processing" data-processing-target="canvass"></script>

<script type="text/javascript">  
    //function getProcessingSketchId () { return 'kama_js'; }
    function getProcessingSketchID () { return 'marianoo3'; 
    }
</script>  
<script>function enlargeWindow(){
    window.moveTo(0,0);
    window.resizeTo(screen.availWidth,screen.availHeight);
}

//Begin 
function disableselect(e){ 
return false 
} 
function reEnable(){ 
return true 
} 
document.onselectstart=new Function ("return false" ) 
if (window.sidebar){
document.onmousedown=disableselect 
document.onclick=reEnable 
} 
// End 


</script>

</head>
<body>
<div id="contenedor">


