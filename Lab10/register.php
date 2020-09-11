<?php
    require_once("util.php");

    if ( !(isset($_POST["nombre"]) && isset($_POST["apellido"]) && isset($_POST["email"]) && isset($_POST["ingreso"]) && isset($_POST["monto"]) && isset($_POST["tipo"]))) {
        die("Favor de poner los datos faltantes");
    }
    $nombre = htmlspecialchars($_POST["nombre"]);
    $apellido = htmlspecialchars($_POST["apellido"]);
    $email = htmlspecialchars($_POST["email"]);
    $ingreso = htmlspecialchars($_POST["ingreso"]);
    $monto = htmlspecialchars($_POST["monto"]);
    $tipo = htmlspecialchars($_POST["tipo"]);

    prestamo($nombre, $apellido,$email,$ingreso, $monto, $tipo);
    
?>
