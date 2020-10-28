<?php

//Aqui van lo isset y así 

require_once("util.php");
require_once("model.php");
$result= get_zombie();

if(isset($_POST["estado"])){
    if(is_numeric($_POST["estado"])){
        $estado = $_POST["estado"];
        $result= get_zombie_estado($estado);
    }
}

include("_tabla.html");
?>