<?php

//Aqui van cosas relacionadas a la base de datos 
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
    //$sql=insertarIncidente("$lugar","$tipo");
    $sql = "INSERT INTO `incidentes` (`fecha`, `lugar`, `tipo`) VALUES (current_timestamp(), '".$lugar."', '".$tipo."');";
    if(mysqli_query($conexion_db, $sql)){
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


function get_incidente(){
    $resultado="";
    $conexion_db = conectDB();
    $query= "Call getIncidente();";
    $resultado = mysqli_query($conexion_db,$query);
    closeDB($conexion_db);
    return $resultado;

}

/*Consulta
DELIMITER $$
CREATE PROCEDURE getIncidente( )
BEGIN
	Select * FROM `incidentes`;
END$$
DELIMITER ;
*/


function get_lugar($lugar){
    $resultado="";
    $conexion_db = conectDB();
    $query= "Call  getLugar($lugar);";
    $resultado = mysqli_query($conexion_db,$query);
    closeDB($conexion_db);
    return $resultado;

}

/*Consulta
DELIMITER $$
CREATE PROCEDURE getLugar( 
    IN ulugar INT(11)
)
BEGIN
	SELECT * FROM `incidentes` WHERE lugar=ulugar;
END$$
DELIMITER ;
*/









function create_table($consulta)
    {
        $heading = array("FechaHora", "Lugar", "Tipo");
        $tabla="";
        if (mysqli_num_rows($consulta) > 0){
            $tabla .= '<table class="table container shadow table-striped table-bordered ">';
                $tabla .= "<thead>";
                    $tabla .= " <tr>";
                        for($i = 0; $i < count($heading); $i++) {
                            $tabla .= '<th class="text-center">' .$heading[$i].'</th>' ;
                        }
                    $tabla .= " </tr>";
                $tabla .= "</thead>";
                $tabla .= "<tbody>";
                    while($row = mysqli_fetch_assoc($consulta)) {
                        $tabla .= '<tr>';
                            $tabla .= '<td class="text-center">'.$row["fecha"].'</td>';
                            $tabla .= '<td class="text-center">'.$row["lugar"].'</td>';
                            $tabla .= '<td class="text-center">'.$row["tipo"].'</td>';
                        $tabla .="</tr>";
                    }
                $tabla .= "</tbody>";
            $tabla .= "</table>";
            mysqli_free_result($consulta); 
            $tabla .= "</table>";
            return $tabla;
        }
    }




//PARA ELIMINAR


function get_fecha(){
    $resultado="";
    $conexion_db = conectDB();
    $query= "Call getFecha();";
    $resultado = mysqli_query($conexion_db,$query);
    closeDB($conexion_db);
    return $resultado;
}

/*Consulta
DELIMITER $$
CREATE PROCEDURE getFecha( )
BEGIN
	Select fecha FROM `incidentes`;
END$$
DELIMITER ;
*/

function select_fecha() {
    $nombre="fecha";
    $fecha="fecha";
    $tabla="incidentes";
    $resultado = '<select id="'.$nombre.'"  name="'.$nombre.'" class="form-control">';
    $resultado .= '<option value="" disabled selected> Selecciona una '.$nombre.'</option>';
    $conexion_bd = conectDB();
    
    $consulta = 'SELECT '.$fecha.' FROM '.$tabla.'';
    $resultados_consulta = $conexion_bd->query($consulta);  
    while ($row = mysqli_fetch_array($resultados_consulta, MYSQLI_BOTH)) {
        
        $resultado .= '<option value="'.$row[$fecha].'" >'.$row[$fecha].'</option>';
        
    }
    
    mysqli_free_result($resultados_consulta); //Liberar la memoria
    
    $resultado .= '</select>';
    
    closeDB($conexion_bd);
    return $resultado;
}

//ELIMINAR UN REGISTRO

function eliminarIncidente($fecha){
    $conexion_db = conectDB();
    $sql = "Call eliminarIncidente('.$fecha.');" ;
    if(mysqli_query($conexion_db, $sql)){
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

/*Consulta
DELIMITER $$
CREATE PROCEDURE eliminarIncidente(
    IN ufecha timestamp
 )
BEGIN
	DELETE FROM `incidentes` WHERE `fecha` = ufecha;
END$$
DELIMITER ;
*/







?>
