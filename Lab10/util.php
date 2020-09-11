<?php
    function prestamo($nombre, $apellido,$email,$ingreso, $monto, $tipo){
        if($monto < $ingreso && $tipo== "Ejecutivo"){
            $aprovado= "¡Felicidades fuiste aprobado!";
            $iva=" El iva anual será 5%";
            $pago="Pagarás $monto en 3 años";
        }
        else if ( $monto < $ingreso && $tipo== "Master"){
            $aprovado= "¡Felicidades fuiste aprobado!";
            $iva=" El iva anual será 10%";
            $pago="Pagarás $monto en 4 años";
        }
        else if ( $monto < $ingreso && $tipo== "Plus"){
            $aprovado= "¡Felicidades fuiste aprobado!";
            $iva=" El iva anual será 15%";
            $pago="Pagarás $monto en 5 años";
        }
        else if ( $monto > $ingreso && $tipo== "Plus"){
            $aprovado= "Lo lamentamos tu prestamo no fue aprobado";
            $iva=" El iva anual será 0%";
            $pago="No habrá pagos por hacer";
        }
    }
    include("_prestamo_aprobar.html");
   

    
?>