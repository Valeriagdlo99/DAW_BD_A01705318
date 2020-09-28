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
function getMayoreo($cantidad_esperada){
    $resultado="";
    $conexion_db  = conectDB();
    $sql= "SELECT id_accesorio, nombre, descripcion , cantidad, precio FROM accesorio WHERE cantidad >=  '".$cantidad_esperada."'  ";
    $resultado = mysqli_query($conexion_db,$sql);
    closeDB($conexion_db);
    return $resultado;
}
function getNombre($nombre_BS){
    $resultado="";
    $conexion_db  = conectDB();
    $sql= "SELECT id_accesorio, nombre, descripcion , cantidad, precio FROM accesorio WHERE nombre LIKE '%".$nombre_BS."%'  ";
    $resultado = mysqli_query($conexion_db,$sql);
    closeDB($conexion_db);
    return $resultado;
}
/*
function select($table, $id_accesorio="id_accesorio", $nombre="nombre"){
    $resultado = '"<select class="custom-select" id="inputGroupSelect01">"';
    $resultado .="<option selected>Seleeciona un ..</option>";
    $conexion_db= conectDB();

    $resultado .= "</select>";
    closeDB($conexion_db);
    return $resultado;
}
*/

?>