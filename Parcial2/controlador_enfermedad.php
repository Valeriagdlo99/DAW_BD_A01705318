<?php

//Aqui van lo isset y así 

require_once("util.php");
require_once("model.php");
$action="";
$result= get_zombie();

if(isset($_POST["nombre"])&& isset($_POST["estado"])){
        $nombre = $_POST["nombre"];
        $estado= $_POST["estado"];
        if(insertar_zombie($nombre,$estado)){
            $result= get_zombie();
            $action=true;
        }  
}else{
    $action=false;
}

include("_alert_registrar.html");
include("_tabla.html");
?>
