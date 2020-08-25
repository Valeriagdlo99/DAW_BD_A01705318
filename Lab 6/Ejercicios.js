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
function Color(){
    titulo=document.getElementById("color");
    let color= "#ea899a ";
    let font = "Lucida Sans";
    let size= "xx-large";
    titulo.style.color= color;
    titulo.style.fontFamily = font;
    titulo.style.fontSize= size ;
}
function help(){
    document.getElementById('header').innerHTML = "SECCIÓN DE AYUDA";
    document.getElementById('duda').innerHTML = "¿Tienes alguna duda?";
    document.getElementById('contacto').innerHTML = "Escríbeme: ogva27@hotmail.com";
}
function bienvenida() {
    alert("Bienvenido a tu tienda de crossfit online");
}
setTimeout(bienvenida,5000);

function allowDrop(ev) {
    ev.preventDefault();
}
  
function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}
  
function drop(ev) {
    ev.preventDefault();
    let data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}