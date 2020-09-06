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

  
  include("_footer.html"); 
?>