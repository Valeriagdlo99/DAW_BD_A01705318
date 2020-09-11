<?php
    if ( !(empty($_POST["nombre"]) && empty($_POST["apellido"]) && empty($_POST["email"]) && empty($_POST["ingreso"]) && empty($_POST["monto"]) && empty($_POST["tipo"]))) {
        die("Favor de poner los datos faltantes");
    }
    else {
        $nombre = htmlspecialchars($_POST["nombre"]);
    $apellido = htmlspecialchars($_POST["apellido"]);
    $email = htmlspecialchars($_POST["email"]);
    $ingreso = htmlspecialchars($_POST["ingreso"]);
    $monto = htmlspecialchars($_POST["monto"]);
    $tipo = htmlspecialchars($_POST["tipo"]);

    $aprobado="";
    $iva="";
    $pago="";
        if($ingreso > $monto  && $tipo == "Ejecutivo"){
            $aprobado= "¡Felicidades fuiste aprobado!";
            $iva=" El iva anual será 5%";
            $pago="Pagarás $monto en 3 años";
        }else if ( $ingreso > $monto  && $tipo == "Master"){
            $aprobado= "¡Felicidades fuiste aprobado!";
            $iva=" El iva anual será 10%";
            $pago="Pagarás $monto en 4 años";
        }else if ($ingreso > $monto && $tipo== "Plus"){
            $aprobado= "¡Felicidades fuiste aprobado!";
            $iva=" El iva anual será 15%";
            $pago="Pagarás $monto en 5 años";
        }else if ($ingreso <= $monto){
            $aprobado= "Lo lamentamos tu prestamo no fue aprobado";
            $iva=" El iva anual será 0%";
            $pago="No habrá pagos por hacer";
        }else{
            $aprobado= "Lo lamentamos tu prestamo no fue aprobado";
            $iva=" El iva anual será 0%";
            $pago="No habrá pagos por hacer";
        }
    include("_head.html");
    include("_prestamo_aprobar.html");
    include("_footer.html"); 
    }
    
    
?>