var counter1 = 2;
var counter2 = 0;

function addStorage(usedStorageLocationsCount, storageLocationsCount){
    if(usedStorageLocationsCount > 0 && usedStorageLocationsCount >= counter1)
        counter1 = usedStorageLocationsCount + 1;
    var storage = document.querySelector("#varastot");
    var newdiv = document.createElement("div");
    newdiv.id = "varasto"+counter1;
    var newHTML = "<select name=\"storageLocations["+(counter1-1)+"][0]\">";
    for(var i = 0; i < storageLocationsCount; i++)  {
        newHTML += "<option value=\""+(i+1)+"\">Jääkaappi "+(i+1)+"</option>";
    }
    newHTML += "</select> <input type=\"number\" size=\"3\" name=\"storageLocations["+(counter-1)+"][1] \"> kpl &nbsp; <button type=\"button\" onClick=\"removeStorage("+counter+")\">Poista</button>";
    newdiv.innerHTML = newHTML;
    counter1++;
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

function eluateAmounts(e){
    console.log(e.target);
    var newI = document.createElement("input");
    newI.innerHTML = "type=\"number\" name=\"amount"+counter2+"\"";
    counter2++;
    document.querySelector("#selected").appendChild(newI);
    newI.outerHTML= e.toElement.innerText+newI.outerHTML+"<br />";
}

