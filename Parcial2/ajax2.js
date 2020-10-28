
$("#registrar").click(function () {
    $.post("controlador.php", {
        nombre: $("#nombre").val()
    }).done(function (data) {
        $("#resultados_consulta").html(data);
    }).fail(function () {
        alert("error");
    });
});
