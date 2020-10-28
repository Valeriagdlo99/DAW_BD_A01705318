<?php
require_once("model.php");
require_once("util.php");

include("_head.html");

$result=  get_nombres();

;include("_navbar.html");
include("_intro.html");
include("_registrar.html");
include("_tabla2.html");

include("_footer.html");

?>