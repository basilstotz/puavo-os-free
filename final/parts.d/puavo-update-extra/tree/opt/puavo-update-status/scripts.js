
function httpGet(theUrl, callback)

{
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.onreadystatechange = function() { 
        if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
            callback(xmlHttp.responseText);
    }
    xmlHttp.open("GET", theUrl, true); // true for asynchronous 
    xmlHttp.send(null);

}

function reload() {
  location.replace("http://localhost:1649/index.html")
}
  
function update(addr) {
  httpGet("http://localhost:1649/api/v1/devices/"+addr+"/update", function(response){})
}
  
function poweroff(addr) {
  httpGet("http://localhost:1649/api/v1/devices/"+addr+"/poweroff", function(response){})
}
  
function restart(addr) {
  httpGet("http://localhost:1649/api/v1/devices/"+addr+"/restart", function(response){})
}

  
function getClients() {

    let loading=document.getElementById("loading");
    let url="http://localhost:1649/api/v1/devices/";
    loading.innerHTML= "Loading ...";
    httpGet(url,function(response){
                   let tabelle=document.getElementById("tabelle");
                   tabelle.innerHTML = response;     

                   let loading=document.getElementById("loading");
                   loading.innerHTML="&nbsp;";
                   }
     );
}

	
