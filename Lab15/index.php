<?php

if(isset($_POST["nombre"])) {
    $_SESSION["usuario"] = $_POST["usuario"];
}

if(!isset($_SESSION["usuario"])) {
    $_SESSION["usuario"] = "No hay usuarios previos, ¡registrate!";
}
include("_head.html");
include("_form.html");
include("_preguntas.html");
include("_footer.html");
?>