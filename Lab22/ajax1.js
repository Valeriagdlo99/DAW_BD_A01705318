
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