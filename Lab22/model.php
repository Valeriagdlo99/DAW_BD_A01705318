<?php

//Cosas con la base de datos
function conectDB(){

    $conexion_db = mysqli_connect("localhost","root","","lab22");
        if (!$conexion_db) {
            die("No se pudo conectar con la base de datos");
        }
        return $conexion_db;
}

function closeDB($conexion_db){
    mysqli_close($conexion_db);
}

function select($nombre,$tabla,$id="id_") {
    $id.= $nombre;
    $resultado = '<select id="'.$nombre.'"  name="'.$nombre.'" class="form-control">';
    $resultado .= '<option value="" disabled selected>Selecciona un '.$tabla.'</option>';
    $conexion_bd = conectDB();
    
    $consulta = 'SELECT '.$id.', '.$nombre.' FROM '.$tabla.' ORDER BY '.$nombre.' ASC';
    $resultados_consulta = $conexion_bd->query($consulta);  
    while ($row = mysqli_fetch_array($resultados_consulta, MYSQLI_BOTH)) {
        
        $resultado .= '<option value="'.$row[$id].'">'.$row[$nombre].'</option>';
    }
    
    mysqli_free_result($resultados_consulta); //Liberar la memoria
    
    $resultado .= '</select>';
    
    closeDB($conexion_bd);
    return $resultado;
}
function insertarIncidente($lugar, $tipo){
    $conexion_db = conectDB();
    $sql = "CALL insertarIncidente( ".$lugar.", ".$tipo.");";

    if(mysqli_query($conexion_db, $sql)){
        echo "Created successfully";
        closeDb($conexion_db);
        unset($_POST);
        return true;
    }else{
        echo "Error: ". $sql."<br>".mysqli_error($conexion_db);
        closeDb($conexion_db);
        unset($_POST);
        return false;
    }
    closeDB($conn);
}




/*

Procedimiento para insertar
DELIMITER $$

CREATE PROCEDURE insertarIncidente(
    IN ulugar INT(11), 
    IN utipo INT(11)
)BEGIN 
    INSERT INTO `incidentes` (`fecha`, `lugar`, `tipo`) VALUES (current_timestamp(), lugar, tipo);
END$$

DELIMITER ;


*/

?>
