function buscar(consulta){
    $.ajax({
        url:"buscar.php",
        method: 'POST',
        dataType: "html",
        data:{consulta: consulta},
    })
    .done(function(respuesta){
        $("#datos").html(respuesta);
        console.log("si");
    })
    .fail(function(){
        console.log("error");
    })
}
$(document).on("keyup","#caja",function (){
    var valorb= $(this).val();
    if(valorb != ""){
        buscar(valorb);
    }else{
        buscar();
    }
});
buscar();

