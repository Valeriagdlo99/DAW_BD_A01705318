<?php
require_once("model.php");
require_once("util.php");

include("_head.html");

$result=0;
$otra=0;
$consulta2=0;
$consulta=0;

include("_navbar.html");
include("_intro.html");
include("_cantidad.html");

include("_consultar_cant.html");
include("_cantidad_zombies.html");

include("_consultar_cant_estado.html");
include("_cantidad_zombies_estado.html");
include("_footer.html");

?>