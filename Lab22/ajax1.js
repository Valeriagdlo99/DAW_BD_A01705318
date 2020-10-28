

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
    console.log("click");
    $.post("controlador_consultar.php", {
        lugar: $("#lugar").val(),
        tipo: $("#tipo").val()
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