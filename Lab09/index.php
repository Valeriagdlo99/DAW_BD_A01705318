<?php 
  include("_head.html");
  $arr = array(10, 8, 7, 10,10,8, 9);
?> 
  <div class="container p-3 my-3 border">
    <h1 class="text-center">Función 1</h1>
    <p>Una función que reciba un arreglo de números y devuelva su promedio</p>
    <?= average($arr)?>
  </div>
  <div class="container p-3 my-3 bg-dark text-white">
    <h1 class="text-center">Función 2</h1>
    <p>Una función que reciba un arreglo de números y devuelva su mediana.</p>
    <?= median($arr)?>
  </div>
  <div class="container p-3 my-3 bg-primary text-white">
    <h1 class="text-center" >Función 3</h1>
    <p>Una función que reciba un arreglo de números y muestre la lista de números, y como ítems de una lista html muestre el promedio, la media, y el arreglo ordenado de menor a mayor, y posteriormente de mayor a menor</p>
    <?= lista($arr)?>  
  </div>
<?php 
  function average($arr){
    echo "Promedio de los números  = " . (array_sum($arr)/count($arr));
  }
  function median($arr) {
    sort($arr);
    $count = count($arr);
    $m = floor(($count-1)/2);
    if($count % 2) {
    $median = $arr[$m];
    } else {
    $l = $arr[$m];
    $h = $arr[$m+1];
    $median = (($l +$h )/2);
    }
    echo "Mediana de los números  = " . ($median);
  }
  function lista(&$arr){
    shuffle($arr);
    echo"<ul>";
        echo "<li> Número de la lista: ";
          foreach ($arr as $value){
               echo $value. ", ";
          }
        echo "</li>";
        echo "<li> Promedio: " .(array_sum($arr)/count($arr))."</li>";
          sort($arr);
          $count = count($arr);
          $m = floor(($count-1)/2);
          if($count % 2) {
          $median = $arr[$m];
          } else {
          $l = $arr[$m];
          $h = $arr[$m+1];
          $median = (($l +$h )/2);
          }
        echo "<li> Mediana: ".$median."</li>";
        echo "<li> Menor a mayor: ";
          sort($arr);
          foreach ($arr as $value){
            echo $value. ", ";
          }
        echo "</li>";
        echo "<li> Mayor a menor: " ;
          rsort($arr);
          foreach ($arr as $value){
            echo $value. ", ";
          }
        echo "</li>";
    echo"</ul>";

    
  }                           
  

  
  include("_footer.html"); 
?>