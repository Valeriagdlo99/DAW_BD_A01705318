<?php

//Aqui van lo isset y así 

require_once("util.php");
require_once("model.php");
$consulta= get_cant_zombies();

$result= get_zombies($consulta);

include("_cantidad_zombies.html");

?>