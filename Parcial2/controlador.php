<?php

//Aqui van lo isset y así 

require_once("util.php");
require_once("model.php");
$action="";
$result= get_nombres();

if(isset($_POST["nombre"])){
        $nombre = htmlspecialchars($_POST["nombre"]);
        if(insertar_nombre($nombre)){
            $result= get_nombres();
            $action=true;
        }  
}else{
    $action=false;
}

include("_alert_registrar.html");
include("_tabla.html");
?>
