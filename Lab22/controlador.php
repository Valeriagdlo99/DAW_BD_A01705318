<?php

//Aqui van lo isset y así 

require_once("util.php");
require_once("model.php");

if(isset($_POST["lugar"])   && isset($_POST["tipo"])){
    if(is_numeric($_POST["lugar"]) && is_numeric($_POST["tipo"])){
        $lugar = $_POST["lugar"];
        $tipo = $_POST["tipo"];
        if(insertarIncidente($lugar, $tipo)){
            $result= get_incidente();
        }  
    }
}else{
    alert("Favor de completar los campos");
}
include("_tabla.html");
?>
