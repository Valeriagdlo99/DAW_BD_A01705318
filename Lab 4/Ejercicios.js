
function ejercicio1() {
  var n = prompt("Ingresar numero deseado");
  var square = new Array();
  var cube = new Array();
  let article = document.getElementsByTagName("article")[0];
  let table = document.createElement("table");
  let body = document.createElement("body");

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
  table.style.backgroundColor = "rgb(160, 160, 231)";
}
function ejercicio2(){
    var start, end, final_time;
    start = new Date();
    var num1 = Math.floor(Math.random() * (100 - 0)) + 1;
    var num2 = Math.floor(Math.random() * (100 - 0)) + 1;
    var result = num1 + num2;
    console.log(result);
    var answer = prompt("Resuelve :" + num1 + " + " + num2);
    console.log(answer);
    end = new Date()
    final_time = (end - start)/1000;
    if (result == answer){
        document.getElementById('ejercicio2').innerHTML = "Correcto! Tiempo: " + final_time + " segundos";
    } else {
        document.getElementById('ejercicio2').innerHTML = "Incorrecto! Tiempo: " +final_time + " segundos";

    }
}
function ejercicio3(array) {
    var  i=0,positive = 0, negative = 0, cero = 0;
    while( i < array.length){
        if (array[i] > 0){
            positive++;
        }
        if (array[i] < 0){
            negative++;
        }
        if (array[i] == 0){
            cero ++;
        }
        i++;
    }
    /*document.write(" Negativos: " + negative +  " Positivos: " + positive + " Ceros: " + cero);*/
    document.getElementById("ejercicio3").innerHTML = " Negativos: " + negative +  " Positivos: " + positive + " Ceros: " + cero ; 
}
function ejercicio4(array) { 
    var aux;
    var fila=0;
    var acum=0;
    /*
    var capa = document.getElementById("ejercicio4.1");
    var p = document.createElement("p");
    */
    for (var i = 0; i < array.length; i++) {
        acum=0;
        for (var j = 0; j < array.length; j++) {
            acum=acum + array[i][j];
            
        } 
        aux=acum/array.length ;
        fila= i+1;
        alert ("Promedio"+ "\nFila: " + fila + "\nProm: " + aux);
   }
       
}
function ejercicio5(numero) { 
    size= numero.length;
    var acum;
    var n = numero.toString();
    var strReverse = n.split('').reverse() 
    acum=strReverse.join('')
    document.getElementById("ejercicio5").innerHTML = "El número invertido es: " + acum; 
    
}


function Transport( brand, year) {
    this.brand = brand;
    this.year = year;brand;
    this.getBrand = function () {
        return this.brand;
    }
    this.getYear = function () {
        return this.year;
    }
}
Transport.prototype.Car = function(wheels) {
    this.wheels = wheels;
    this.getWheels = function () {
        return this.wheels;
    }
    return ("Modelo: " + this.brand + "\nMarca: " + this.year + "\nWheels:" + this.wheels);
  };

Transport.prototype.Airplane = function(wings) {
    this.wings = wings;
    this.getWheels = function () {
        return this.wings;
    }
    return ("Modelo: " + this.brand + "\nMarca: " + this.year + "\nWings:" + this.wings);
  };

function ejercicio6(){
    let transport1 = new Transport("Ferrari", '2020');
    let transport2 = new Transport("Boeing", "2002" );
    alert (transport1.Car(4));
    alert (transport2.Airplane(2));
}

/*
        Printear cosas:
         en consola:  console.log(new_Array);
         en una caja: alert (new_Array);
         regresar todo un objeto: document.getElementById("demo").innerHTML = typeof fruits;
         imprimir arreglos: document.getElementById("demo").innerHTML = fruits.toString();
        */