/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var counter = 2;

function addStorage(){
    var storage = document.querySelector("#varastot");
    var newdiv = document.createElement("div");
    newdiv.id = "varasto"+counter;
    newdiv.innerHTML = "Varastopaikkassa "+counter+" <select name=\"storageLocations["+(counter-1)+"][0]\"><option value=\"1\">Jääkaappi 1</option><option value=\"2\">Jääkaappi 2</option><option value=\"3\">Jääkaappi 3</option></select><input type=\"number\" name=\"storageLocations["+(counter-1)+"][1]\"> kappaletta <button type=\"button\" onClick=\"removeStorage("+counter+")\">Poista varasto</button>";
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
