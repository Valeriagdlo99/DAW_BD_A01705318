<?php
function conectDB(){

    $conexion_db = mysqli_connect("localhost","root","","fitstore");
        if (!$conexion_db) {
            die("No se pudo conectar con la base de datos");
        }
        return $conexion_db;
}

function closeDB($conexion_db){
    mysqli_close($conexion_db);
}

function getAccesorio(){
    $resultado="";
    $conexion_db  = conectDB();
    $sql= "SELECT id_accesorio, nombre, descripcion , cantidad, precio FROM accesorio";
    $resultado = mysqli_query($conexion_db,$sql);
    closeDB($conexion_db);
    return $resultado;
}

    function insertAccesorio($id,$nombre,$descripcion,$cantidad,$precio){
        $conexion_bd = conectDB();
        $registrar = 'INSERT INTO accesorio (id_accesorio,nombre, descripcion, cantidad, precio) VALUES(?, ?, ?, ?, ?)';    
        if ( !($statement = $conexion_bd->prepare($registrar))) {
          die("Error: (" . $conexion_bd->errno . ") " . $conexion_bd->error);
          return 0;
        }
        if (!$statement->bind_param("sssss",$id, $nombre,$descripcion,$cantidad,$precio)){
          die("Error en vinculación: (" . $statement->errno . ") " . $statement->error);
          return 0;
        }
        if (!$statement->execute()) {
          die("Error en ejecución: (" . $statement->errno . ") " . $statement->error);
          return 0;
        }
    
        closeDB($conexion_bd);
        return 1;
      }
      function editAccesorio($id,$nombre,$descripcion,$cantidad,$precio){
        $conexion_bd = conectDB(); 
        $modificar = 'UPDATE accesorio SET nombre=(?),descripcion=(?),cantidad=(?), precio=(?)  WHERE id_accesorio=(?)';
    
        if ( !($statement = $conexion_bd->prepare($modificar))) {
          die("Error: (" . $conexion_bd->errno . ") " . $conexion_bd->error);
          return 0;
        }
        if (!$statement->bind_param("sssss",$nombre,$descripcion,$cantidad,$precio,$id )) {
          die("Error en vinculación: (" . $statement->errno . ") " . $statement->error);
          return 0;
        }
        if (!$statement->execute()) {
          die("Error en ejecución: (" . $statement->errno . ") " . $statement->error);
          return 0;
        }
        closeDB($conexion_bd);
        return 1;
      }
      function deleteAccesorio($id,$nombre,$descripcion,$cantidad,$precio){
        $conexion_bd = conectDB();
        $eliminar = 'DELETE FROM accesorio WHERE id_accesorio=(?) AND nombre=(?) AND descripcion=(?) AND cantidad=(?) AND precio=(?)';
        if ( !($statement = $conexion_bd->prepare($eliminar)) ) {
          die("Error: (" . $conexion_bd->errno . ") " . $conexion_bd->error);
          return 0;
        }
        if (!$statement->bind_param("sssss", $id,$nombre,$descripcion,$cantidad,$precio)) {
          die("Error en vinculación: (" . $statement->errno . ") " . $statement->error);
          return 0;
        }
        if (!$statement->execute()) {
          die("Error en ejecución: (" . $statement->errno . ") " . $statement->error);
          return 0;
        }
        closeDB($conexion_bd);
        return 1;
    }
?>