<?php

//Aqui van lo isset y así 

$consulta2=0;
$consulta=0;
$otra=0;
$action="hola";
require_once("util.php");
require_once("model.php");

if(!empty( $_POST["estado"])){
    $estado = $_POST["estado"];
    $consulta2=get_cant_estado($estado);
    $otra= get_estadoss($consulta2);
}else{
    $action=false;
}



include("_cantidad_zombies_estado.html");
include("_alert_consultar.html");

?>