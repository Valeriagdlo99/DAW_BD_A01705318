$("#guardar").click(function () {
    $.post("registrarcontrolador.php", {
        lugar: $("#lugar").val(),
        tipo: $("#tipo").val()
    }).done(function (data) {
        $("#resultados_consulta").html(data);
    }).fail(function () {
        alert("error");
    });
});
