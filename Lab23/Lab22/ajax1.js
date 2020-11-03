
$("#save").click(function () {
    $.post("controlador.php", {
        lugar: $("#lugar").val(),
        tipo: $("#tipo").val()
    }).done(function (data) {
        $("#resultados_consulta").html(data);
    }).fail(function () {
        alert("error");
    });
});

$("#consultar").click(function () {
    $.post("controlador_consultar.php", {
        lugar: $("#lugar").val()
    }).done(function (data) {
        $("#resultados_consulta").html(data);
    }).fail(function () {
        alert("error");
    });
});

$("#eliminar").click(function () {
    $.post("controlador_eliminar.php", {
        fecha: $("#fecha").val()
    }).done(function (data) {
        $("#resultados_consulta").html(data);
    }).fail(function () {
        alert("error");
    });
});

$("#actualizar").click(function () {
    $.post("controlador_actualizar.php", {
        lugar: $("#lugar").val(),
        nuevo_lugar: $("#nuevo_lugar").val()
    }).done(function (data) {
        $("#resultados_consulta").html(data);
    }).fail(function () {
        alert("error");
    });
});

function iniciarMap(){

	function localizacion(posicion){
		var latitude = posicion.coords.latitude;
		var longitude = posicion.coords.longitude;
		var coord = {lat:latitude ,lng: longitude};
	    var map = new google.maps.Map(document.getElementById('map'),{
	      zoom: 10,
	      center: coord
	    });
	    var marker = new google.maps.Marker({
	      position: coord,
	      map: map
	    });
	}

	function error(){
		output.innerHTML = "<p>No se pudo obtener tu ubicación</p>";

	}
	navigator.geolocation.getCurrentPosition(localizacion,error);

}

/*
let boton = document.getElementById("save");
boton.onclick = hola;

function hola() {
    console.log("Hi");
}

/*
$( "#save" ).click(function() {
    alert( "Handler for .click() called." );
  });
*/