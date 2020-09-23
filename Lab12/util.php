<?php
    session_start();
    if ( !(empty($_POST["nombre"]) && empty($_POST["usuario"]) && empty($_POST["email"]) && empty($_POST["password"]) && empty($_POST["rep_password"]) && empty($_POST["fileToUpload"]))) {
            die("Favor de poner los datos faltantes");
    }

    $nombre = htmlspecialchars($_POST["nombre"]);
    $usuario = htmlspecialchars($_POST["usuario"]);
    $email = htmlspecialchars($_POST["email"]);
    $password = htmlspecialchars($_POST["password"]);
    $rep_password = htmlspecialchars($_POST["rep_password"]);
        
?>