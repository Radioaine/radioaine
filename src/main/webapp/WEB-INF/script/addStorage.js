/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var counter = 1;

function addStorage(){
    var storage = document.querySelector("#varasto");
    var newdiv = document.createElement("div");
    newdiv.innerHTML = "Varastopaikkassa 2 <select><option value=\"Jääkaappi 1\">Jääkaappi 1</option><option value=\"Jääkaappi 2\">Jääkaappi 2</option><option value=\"Jääkaappi 3\">Jääkaappi 3</option></select><input type=\"number\" name=\"storageLocations[1]\">";
    storage.appendChild(newdiv);
}

