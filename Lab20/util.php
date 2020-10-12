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
/*
function create_table()
    {
        $heading = array("Nombre", "Correo", "Consultas");
        $users = get_users();
        if (mysqli_num_rows($users) > 0){
            $tabla = '<table class="table container shadow table-striped table-bordered table-hover ">';
                $tabla .= "<thead>";
                    $tabla .= " <tr>";
                        for($i = 0; $i < count($heading); $i++) {
                            $tabla .= '<th class="text-center">' .$heading[$i].'</th>' ;
                        }
                    $tabla .= " </tr>";
                $tabla .= "</thead>";
                $tabla .= "<tbody>";
                    while($row = mysqli_fetch_assoc($users)) {
                        $tabla .= '<tr>';
                            $tabla .= '<td class="text-center">'.$row["usuario"].'</td>';
                            $tabla .= '<td class="text-center">'.$row["correo"].'</td>';
                            $tabla .= '<td class="text-center"> <a href="#" class="btn btn-info btn-xs"><i class="fas fa-search"></i> Consultar</a> <a href="#" class="btn btn-info btn-xs"><i class="fas fa-trash-alt"></i> Eliminar</a> </td> ';
                        $tabla .="</tr>";
                    }
                $tabla .= "</tbody>";
            $tabla .= "</table>";
            mysqli_free_result($users); 
            $tabla .= "</table>";
            return $tabla;
        }
    }
*/
?>