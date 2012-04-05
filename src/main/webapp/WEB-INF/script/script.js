var storageCounter = 2;
var eluateCounter = 0;
var selectionCounter = 0;

function addStorage(usedStorageLocationsCount, storageLocationsCount, names){
    var p = names.split("^separate^");
    if(usedStorageLocationsCount > 0 && usedStorageLocationsCount >= storageCounter)
        storageCounter = usedStorageLocationsCount + 1;
 
    
    var newHTML = "<select name=\"storageLocations["+(storageCounter-1)+"][0]\">";
    for(var i = 0; i < (p.length-1); i++)  {
        if(p[i] != "^hidden^")
            newHTML += "<option value=\""+(i+1)+"\">"+ p[i] +"</option>";
    }
    newHTML += "</select> <input class=\"temp\" onchange=\"countAmount()\" value=\"0\" id=\"storageAmount\" type=\"number\" size=\"3\" name=\"storageLocations["+(storageCounter-1)+"][1] \"> kpl &nbsp; <button type=\"button\" onClick=\"removeStorage("+storageCounter+")\">Poista</button>";
    var temp = $('<div>').attr("id", "varasto"+storageCounter );
    temp.html(newHTML);
    storageCounter++;
    $("#varastot").append(temp);
}

//Ongelma jossa jos lisää vaikka kome ja poistaa keskimmäisen niin numerointi menee sekaisin;
function removeStorage(number){
    var storage = document.getElementById("varastot");
    var remove = document.getElementById("varasto"+number);
    storageCounter--;
    storage.removeChild(remove);
    countAmount();
}

function qualityResults(){
    var holder = document.getElementById("qualityCheck");
    holder.innerHTML = "<form action=\"doCheck\"><select name=\"qualityCheck\"><option value=\"1\">Hyväksytty</option><option value=\"2\">Hylätty</option></select>"
}

function eluateAmounts(e){
    var temp = $('<div>').attr("id", "selection"+selectionCounter );
    var newHTML = "";
    if(e.target.id == "0"){

        newHTML = "<button type=\"button\" onclick=\"removeSelection(event)\">Poista</button> &nbsp;"+e.target.innerHTML+"<input type=\"hidden\" name=\"generators\" value=\""+e.target.value+"\"\>";
    }
    else if(e.target.id == "1"){
        newHTML = "<button type=\"button\" onclick=\"removeSelection(event)\">Poista</button> &nbsp;"+e.target.innerHTML+"<input type=\"hidden\" name=\"kits\" value=\""+e.target.value+"\"\>";
    }
    else if(e.target.id == "3"){
        newHTML = "<button type=\"button\" onclick=\"removeSelection(event)\">Poista</button> &nbsp;"+e.target.innerHTML+"<input type=\"hidden\" name=\"eluates\" value=\""+e.target.value+"\"\>";
    }
    else{     
        newHTML = "<button type=\"button\" onclick=\"removeSelection(event)\">Poista</button> &nbsp;"+e.target.innerHTML+"<input type=\"hidden\" name=\"others\" value=\""+e.target.value+"\"\>";
    }
    temp.html(newHTML);
    selectionCounter++;
    $("#selected").append(temp);
}

function removeSelection(e){
    console.log(e.target.parentNode);
    $(e.target.parentNode).remove();
    selectionCounter--;
}

function addComment(e){
    var temp = e.target.parentNode;
    var newForm = document.createElement("form");
    newForm.action = "addStatusComment/"+e.target.value+"+"+e.target.id;
    newForm.method= "POST";
    newForm.innerHTML = "<input type=\"text\" name=\"comment\" /><button type=\"submit\">Tallenna</button>";
    temp.removeChild(e.target);
    temp.appendChild(newForm);
    console.log(e.target.parentNode);
}

function countAmount(){
    var total=0;
    var amounts = $(".temp");
    for(var i=0; i<amounts.length; i++){
        total += parseInt(amounts[i].value);
    }
    $("#t").text(total+" kpl");
    
}

function editStorageName(id)  {
    document.getElementById("edit"+id).style.cssText = "display: none;";
    document.getElementById("name"+id).style.cssText = "display: none;";
    document.getElementById("save"+id).style.cssText = "display: inline;";
    document.getElementById("cancel"+id).style.cssText = "display: inline;";
    document.getElementById("inp"+id).style.cssText = "display: inline;";
    
    if(document.getElementById("inp"+id).value != null)
        document.getElementById("inp"+id).value = document.getElementById("name"+id).innerText;
    else
        document.getElementById("inp"+id).value = "";
}