<?php
    require_once("util.php"); 
    include("_head.html");  
    if ( (empty($_POST["nombre"]) && empty($_POST["id"]) && empty($_POST["descripcion"]) && empty($_POST["cantidad"]) && empty($_POST["precio"]))) {
        die("Favor de poner los datos faltantes");
    }
    delete_accesorio();  
    function delete_accesorio(){
        $id = htmlspecialchars($_POST["id"]);
        $nombre = htmlspecialchars($_POST["nombre"]);
        $descripcion = htmlspecialchars($_POST["descripcion"]);
        $cantidad = htmlspecialchars($_POST["cantidad"]);
        $precio = htmlspecialchars($_POST["precio"]);

        if(isset($nombre) && isset($descripcion)){
            if(is_numeric($id) && is_numeric($cantidad) && is_numeric($precio)){
                if(deleteAccesorio($id,$nombre,$descripcion,$cantidad,$precio))
                {
                    echo("Eliminado!");
                }
                else
                {
                    echo("No se pudo Eliminar!");
                }
            }
            else
            {
                echo("No se ha pudo registrar!");
            }
        }
    }
    include("_termiando.html");
    include("_preguntas.html");
    include("_footer.html");
    
?>