var storageCounter = 2;
var eluateCounter = 0;
var selectionCounter = 0;

function addStorage(usedStorageLocationsCount, storageLocationsCount){
    if(usedStorageLocationsCount > 0 && usedStorageLocationsCount >= storageCounter)
        storageCounter = usedStorageLocationsCount + 1;
    var storage = document.querySelector("#varastot");
    var newdiv = document.createElement("div");
    newdiv.id = "varasto"+storageCounter;
    var newHTML = "<select name=\"storageLocations["+(storageCounter-1)+"][0]\">";
    for(var i = 0; i < storageLocationsCount; i++)  {
        newHTML += "<option value=\""+(i+1)+"\">Jääkaappi "+(i+1)+"</option>";
    }
    newHTML += "</select> <input onchange=\"countAmount()\" value=\"0\" id=\"storageAmount\" type=\"number\" size=\"3\" name=\"storageLocations["+(storageCounter-1)+"][1] \"> kpl &nbsp; <button type=\"button\" onClick=\"removeStorage("+storageCounter+")\">Poista</button>";
    newdiv.innerHTML = newHTML;
    storageCounter++;
    storage.appendChild(newdiv);
}

//Ongelma jossa jos lisää vaikka kome ja poistaa keskimmäisen niin numerointi menee sekaisin;
function removeStorage(number){
    var storage = document.querySelector("#varastot");
    var remove = document.querySelector("#varasto"+number);
    storageCounter--;
    storage.removeChild(remove);
    countAmount();
}

function qualityResults(){
    var holder = document.querySelector("#qualityCheck");
    holder.innerHTML = "<form action=\"doCheck\"><select name=\"qualityCheck\"><option value=\"1\">Hyväksytty</option><option value=\"2\">Hylätty</option></select>"
}

function eluateAmounts(e){
    console.log(e.target.id);
    var newDiv = document.createElement("div");
    newDiv.id = "selection"+selectionCounter;
    var newHTML = "";
    if(e.target.id == "0"){
        newHTML = "<button type=\"button\" onclick=\"removeSelection("+newDiv.id+")\">Poista</button>"+e.target.innerHTML+"<input type=\"hidden\" name=\"generators\" value=\""+e.target.value+"\"\>";
    }
    else if(e.target.id == "1"){
        newHTML = "<button type=\"button\" onclick=\"removeSelection("+newDiv.id+")\">Poista</button>"+e.target.innerHTML+"<input type=\"hidden\" name=\"kits\" value=\""+e.target.value+"\"\>";
    }
    else{     
        newHTML = "<button type=\"button\" onclick=\"removeSelection("+newDiv.id+")\">Poista</button>"+e.target.innerHTML+"<input type=\"hidden\" name=\"others\" value=\""+e.target.value+"\"\>";
    }
    newDiv.innerHTML = newHTML;
    selectionCounter++;
    document.querySelector("#selected").appendChild(newDiv);
    console.log(newDiv);
}

function removeSelection(elem){
    console.log(elem);
    document.querySelector("#"+elem.id).parentNode.removeChild(elem);
    selectionCounter--;
}

function countAmount(){
    var total=0;
    var amounts = document.querySelectorAll("#storageAmount");
    for(var i=0; i<amounts.length; i++){
        total += parseInt(amounts[i].value);
    }
    document.querySelector("#t").innerText = total+" kpl";
    
}

