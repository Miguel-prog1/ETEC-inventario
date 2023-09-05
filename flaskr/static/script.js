
function mostrarOcultar(e){
    const peine =  e.srcElement.parentElement;
    listaPisos = peine.children.item(1);
    
    if( listaPisos.style.display == "block"){
       listaPisos.style.display = "none";}
    else{
        listaPisos.style.display = "block"
    }
}
const peines = document.querySelectorAll(".lista-peines>li>h1")
peines.forEach(peine => {
    peine.addEventListener("click", mostrarOcultar)
});

