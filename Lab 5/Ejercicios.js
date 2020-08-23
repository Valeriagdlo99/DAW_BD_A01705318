function password() {
    let uno = document.getElementById("rep1").value;
    let rep = document.getElementById("rep2").value;
    /*
    console.log(uno);
    alert(document.getElementById("rep1").value);
    */
    if(uno == rep){
        alert("Contraseña correcta"); 
    }else{
        alert("Las contraseñas no coinciden");
    }
}

function productos(){
    let db = document.getElementById("dumbbell").value;
    let kb = document.getElementById("kettlebell").value;
    let rope = document.getElementById("cuerda").value;
    
    let sub = 0;
    let iva = 0;
    let total = 0;
    let db_price=400;
    let kb_price=500;
    let rope_price=120;

    sub= db_price*db + kb*kb_price + rope*rope_price;
    iva = sub*0.5;
    total= sub+iva;
    document.getElementById("subtotal").innerHTML = "Subtotal: $ "+sub;    
    document.getElementById("iva").innerHTML = "IVA: $ " + iva;
    document.getElementById("total").innerHTML = "Total: $ " + total;
}
function usuario() {
    let esp = document.getElementById("esp").value;
    let fis = document.getElementById("fis").value;
    let mat = document.getElementById("mat").value;
    let usuario = document.getElementById("usuario").value;
    let rep1 = document.getElementById("rep1").value;
    let rep2 = document.getElementById("rep2").value;
    if( esp==1 && fis==1 && mat==1)
    {
        if(rep1 == rep2){
            alert("Contraseña correcta, se registraron las 3 materias"); 
        }else{
            alert("Las contraseñas no coinciden, no se han podido registrar las materias");
        }
    }
    if( esp==1 && fis==1)
    {
        if(rep1 == rep2){
            alert("Contraseña correcta, se registraron: Español y físcia"); 
        }else{
            alert("Las contraseñas no coinciden, no se han podido registrar las materias");
        }
    }
    if( esp==1 && mate==1)
    {
        if(rep1 == rep2){
            alert("Contraseña correcta, se registraron:  Matematicas y Español"); 
        }else{
            alert("Las contraseñas no coinciden, no se han podido registrar las materias");
        }
    }
    if( fis==1 && mate==1)
    {
        if(rep1 == rep2){
            alert("Contraseña correcta, se registraron: Física y Matematicas"); 
        }else{
            alert("Las contraseñas no coinciden, no se han podido registrar las materias");
        }
    }
    if( fis==1)
    {
        if(rep1 == rep2){
            alert("Contraseña correcta, se registró: Física"); 
        }else{
            alert("Las contraseñas no coinciden, no se han podido registrar las materias");
        }
    }
    if( mate==1)
    {
        if(rep1 == rep2){
            alert("Contraseña correcta, se registró: Matematicas"); 
        }else{
            alert("Las contraseñas no coinciden, no se han podido registrar las materias");
        }
    }
    if( esp==1)
    {
        if(rep1 == rep2){
            alert("Contraseña correcta, se registró: Español"); 
        }else{
            alert("Las contraseñas no coinciden, no se han podido registrar las materias");
        }
    }
    else{
        alert("No se pduo registar");

         
    }
    
}
