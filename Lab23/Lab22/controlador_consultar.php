<?php

//Aqui van lo isset y así 

require_once("util.php");
require_once("model.php");
$result= get_incidente();

if(isset($_POST["lugar"])){
    if(is_numeric($_POST["lugar"])){
        $lugar = $_POST["lugar"];
        $result= get_lugar($lugar);
    }
}

include("_tabla.html");
?>