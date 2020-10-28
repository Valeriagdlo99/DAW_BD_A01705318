<?php
require_once("model.php");
require_once("util.php");

include("_head.html");

$result= get_incidente();

include("_navbar.html");
include("_intro.html");
include("_consultar.html");
include("_tabla.html");
include("_footer.html");

?>