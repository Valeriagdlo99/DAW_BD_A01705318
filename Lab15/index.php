<?php
require_once("util.php");

$result = getAccesorio();
include("_head.html");

if(mysqli_num_rows($result)>0){
    echo '<table class="table container shadow">';
    while($row = mysqli_fetch_assoc($result)){
        echo "<tr>";
        echo "<td>".$row["id_accesorio"]."<td>";
        echo "<td>".$row["nombre"]."<td>";
        echo "<td>".$row["descripcion"]."<td>";
        echo "<td>".$row["cantidad"]."<td>";
        echo "<td>".$row["precio"]."<td>";
        echo "<tr>";
    }
    echo "</table>";
    
}

include("_form.html");
include("_preguntas.html");
include("_footer.html");

?>