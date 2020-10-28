<?php
require_once("model.php");
require_once("util.php");

include("_head.html");

$result= get_zombie();
;include("_navbar.html");
include("_intro.html");

include("_registrar_enfermedad.html");
include("_tabla.html");

include("_footer.html");

?>