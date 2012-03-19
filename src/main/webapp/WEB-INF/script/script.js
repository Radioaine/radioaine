
//function sivuLadattu() {
//    var linkit = document.querySelectorAll("a");
//  
//    for (var i = 0; i < linkit.length; ++i) {
//        if (document.location.href.match(linkit[i].href)) {
//            linkit[i].className += "current";
//            linkit[i].href = "";
//        }
//    }
//}
//
//
//if(window.addEventListener) {
//    window.addEventListener('load',sivuLadattu); //W3C
//}
//else {
//    window.attachEvent('onload',sivuLadattu); //IE
//}


var counter = 2;

function addStorage(usedStorageLocationsCount, storageLocationsCount){
    if(usedStorageLocationsCount > 0 && usedStorageLocationsCount >= counter)
        counter = usedStorageLocationsCount + 1;
    var storage = document.querySelector("#varastot");
    var newdiv = document.createElement("div");
    newdiv.id = "varasto"+counter;
    var newHTML = "<select name=\"storageLocations["+(counter-1)+"][0]\">";
    for(var i = 0; i < storageLocationsCount; i++)  {
        newHTML += "<option value=\""+(i+1)+"\">Jääkaappi "+(i+1)+"</option>";
    }
    newHTML += "</select> <input type=\"number\" size=\"3\" name=\"storageLocations["+(counter-1)+"][1] \"> kpl &nbsp; <button type=\"button\" onClick=\"removeStorage("+counter+")\">Poista</button>";
    newdiv.innerHTML = newHTML;
    counter++;
    storage.appendChild(newdiv);
}

//Ongelma jossa jos lisää vaikka kome ja poistaa keskimmäisen niin numerointi menee sekaisin;
function removeStorage(number){
    var storage = document.querySelector("#varastot");
    var remove = document.querySelector("#varasto"+number);
    counter--;
    storage.removeChild(remove);
}

function qualityResults(){
    var holder = document.querySelector("#qualityCheck");
    holder.innerHTML = "<form action=\"doCheck\"><select name=\"qualityCheck\"><option value=\"1\">Hyväksytty</option><option value=\"2\">Hylätty</option></select>"
}

