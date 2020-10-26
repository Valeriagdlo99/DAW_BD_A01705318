<?php

//Validar los datos que me quedan y mandarselos a model 

function insertincidente(){
    $lugar = $_POST["lugar"];
    $tipo = $_POST["tipo"];
    
    if(is_numeric($lugar) && is_numeric($tipo)){
        if(insertarIncidente($lugar, $tipo)){
            }else{   
        }
        }else{
        }
    
}

?>