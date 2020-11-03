<?php
require_once("model.php");
require_once("util.php");

include("_head.html");

$result= get_lugares();

include("_navbar.html");
include("_intro.html");
include("_actualizar.html");
include("_tabla_actualizar.html");
include("_footer.html");

?>