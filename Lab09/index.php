<?php 
  include("_head.html");
  $arr = array(10, 8, 7, 10,10,8, 9);
?> 
  <div class="container p-3 my-3 border">
    <h1 class="text-center">Función 1</h1>
    <p>Una función que reciba un arreglo de números y devuelva su promedio</p>
    <?= average($arr)?>
  </div>
<?php 
  function average($arr){
    echo "Promedio de los números  = " . (array_sum($arr)/count($arr));
  } 

  
  include("_footer.html"); 
?>