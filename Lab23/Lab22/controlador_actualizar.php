<?php

//Aqui van lo isset y así 

require_once("util.php");
require_once("model.php");
$action="";
$result= get_lugares();

if(isset($_POST["lugar"]) && isset($_POST["nuevo_lugar"])){
        $lugar = $_POST["lugar"];
        $nuevo_lugar = htmlspecialchars($_POST["nuevo_lugar"]);
        if(actualizarLugar($lugar,$nuevo_lugar)){
            $result= get_lugares();
            $action=true;
        }  
}else{
    $action=false;
}
include("_alert_actualizar.html");
include("_tabla_actualizar.html");
?>