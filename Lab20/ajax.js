$(buscar());

function buscar(consulta){
    $.ajax({
        url:"index.php",
        method: 'POST',
        dataType: "html",
        data:{consulta: cunsulta},
    })
    .done(function(respuesta){
        $("datos").html(respuesta);
        console.log("si");
    })
    .fail(function(){
        console.log("error");
    })
}

$($document).on("keyup","#caja",function (){
    var valorb= $(this).val();
    if(valorb != ""){
        buscar(valorb);
    }else{
        buscar();
    }
});
