<?php

//Aqui van lo isset y así 

require_once("util.php");
require_once("model.php");
$action="";
$result= get_incidente();

if(isset($_POST["lugar"])&& isset($_POST["tipo"])){
    if(is_numeric($_POST["lugar"]) && is_numeric($_POST["tipo"])){
        $lugar = $_POST["lugar"];
        $tipo = $_POST["tipo"];
        if(insertarIncidente($lugar, $tipo)){
            $result= get_incidente();
            $action=true;
        }  
    }
}else{
    $action=false;
}

include("_alert_registrar.html");
include("_tabla.html");
?>
