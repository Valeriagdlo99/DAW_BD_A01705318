
$("#registrar").click(function () {
    $.post("controlador.php", {
        nombre: $("#nombre").val()
    }).done(function (data) {
        $("#resultados_consulta").html(data);
    }).fail(function () {
        alert("error");
    });
});

$("#registrar_enfermedad").click(function () {
    $.post("controlador_enfermedad.php", {
        nombre: $("#nombre").val(),
        estado: $("#estado").val()
    }).done(function (data) {
        $("#resultados_consulta").html(data);
    }).fail(function () {
        alert("error");
    });
});
