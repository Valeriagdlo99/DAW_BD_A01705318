<?php

//Aqui van lo isset y así 

require_once("util.php");
require_once("model.php");
$action="";
$result= get_incidente();

if(isset($_POST["fecha"])){
        $fecha = $_POST["fecha"];
        if(eliminarIncidente($fecha)){
            $result= get_incidente();
            $action=true;
        }  
}else{
    $action=false;
}
include("_alert_eliminar.html");
include("_tabla.html");
?>