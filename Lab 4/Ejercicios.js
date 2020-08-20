
function ejercicio1() {
  var n = prompt("Ingresar numero deseado");
  var square = new Array();
  var cube = new Array();
  var article = document.getElementsByTagName("article")[0];
  var table = document.createElement("table");
  var body = document.createElement("body");

  for(var i=1; i<=n; i++){
    cube[i] = Math.pow(i, 3);
  }
  for(var i=1; i<=n; i++){
    square[i] = Math.pow(i, 2);
  }
  for (var i = 0; i <= 1; i++) {
    var row = document.createElement("tr");
    for (var j = 0; j <= n; j++) {
      var cell = document.createElement("td");
      if (j==0 && i==0) {
        var texto = document.createTextNode("Cuadrado: ");
      } else if(j==0 && i==1){
        var texto = document.createTextNode('Cubos: ');
      } else{
        if (i==0) {
          var texto = document.createTextNode(square[j]);
        } else {
          var texto = document.createTextNode(cube[j]);
        }
      }
      cell.appendChild(texto);
      row.appendChild(cell);
    }
    body.appendChild(row);
  }

  table.appendChild(body);
  article.appendChild(table);
  table.setAttribute("border", "1");

}
function ejercicio2(){
    var start, end, final_time;
    start = new Date();
    var num1 = Math.floor(Math.random() * (100 - 0)) + 1;
    var num2 = Math.floor(Math.random() * (100 - 0)) + 1;
    var result = num1 + num2;
    var answer = prompt("Resuelve :" + num1 + " + " + num2);
    end = new Date()
    final_time = (end - start)/1000;
    if (result === answer){
        document.getElementById('ejercicio2').innerHTML = "Correcto! Tiempo: " + final_time + "segundos";
    } else {
        document.getElementById('ejercicio2').innerHTML = "Incorrecto Tiempo: " +final_time + "segundos";

    }
}
function ejercicio3(array) {
    var  i=0,positive = 0, negative = 0, null = 0;
    while( i<array.length){
        if (array[i] > 0){
            positive++;
        }
        if (array[i] < 0){
            negative++;
        }
        if (array[i] == 0){
            null ++;
        }
        i++;
    }
    document.getElementById('ejercicio3').innerHTML = " Negativos: " + negatives +  " Positivos: " + pos + " Ceros: " + cero ;
    
    
}
