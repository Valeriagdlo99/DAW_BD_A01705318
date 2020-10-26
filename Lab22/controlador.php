<?php

//Aqui van lo isset y así 

require_once("util.php");
require_once("model.php");

if(isset($_POST["lugar"])   && isset($_POST["tipo"])){
    insertincidente($_POST["lugar"], $_POST["tipo"]);
}else{
    alert("Favor de completar los campos");
}
    

?>
