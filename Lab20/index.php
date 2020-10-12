<?php
include("_head.html");
include("_buscar.html");

    $conexion_db  =mysqli_connect("localhost","root","","fitstore");
    if (!$conexion_db) {
        die("No se pudo conectar con la base de datos");
    }
    $resultado="";
    $tabla="";
    $query= "SELECT * FROM `accesorio` ORDER BY `accesorio`.`id_accesorio` ASC";
    if(isset($_POST["consulta"])){
        $consulta = htmlspecialchars($_POST["consulta"]);
        $query ="SELECT id_accesorio, nombre, descripcion, cantidad, precio from accesorio where nombre like "%".$consulta"; 
    }
    $resultado = $conexion_db ->query($query);
    if($resultado -> num_rows > 0){
        $heading = array("id", "Nombre", "Descripción", "Cantidad", "Precio");
        $tabla = '<table class="table container shadow table-bordered ">';
                $tabla .= '<thead class="bg-primary" >';
                $tabla .= " <tr>";
                        for($i = 0; $i < count($heading); $i++) {
                            $tabla .= '<th class="text-center">' .$heading[$i].'</th>' ;
                        }
                $tabla .= " </tr>";
                $tabla .= "</thead>";
                $tabla .= "<tbody>";
                while($row = $resultado -> fetch_assoc()) {
                    $tabla .= '<tr>';
                        $tabla .= '<td class="text-center">'.$row["id_accesorio"].'</td>';
                        $tabla .= '<td class="text-center">'.$row["nombre"].'</td>';
                        $tabla .= '<td class="text-center">'.$row["descripcion"].'</td>';
                        $tabla .= '<td class="text-center">'.$row["cantidad"].'</td>';
                        $tabla .= '<td class="text-center">'.$row["precio"].'</td>';
                    $tabla .="</tr>";
                $tabla .= "</tbody>";
        
                }
         $tabla .= "</table>";
    }else{
        $tabla.= "No hay datos :(";

    }
    echo $tabla;
    mysqli_close($conexion_db);

include("_preguntas.html");
include("_footer.html");

?>