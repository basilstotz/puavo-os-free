
function httpGet(theUrl)

{
    var xmlHttp = new XMLHttpRequest();
//    xmlHttp.onreadystatechange = function() { 
//        if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
//            callback(xmlHttp.responseText);
//    }
    xmlHttp.open("GET", theUrl, false); // true for asynchronous 
    xmlHttp.send(null);
    return xmlHttp.responseText;
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


  function makeRow(host){
      let tmp;
      let cell;
      let cellText;
      let words;
      let status=[];

      let row = document.createElement("tr");

      let url="http://localhost:1649/api/v1/devices/"+host+"/status";

      let response=httpGet(url);

      words=response.split(" ");
      for(var i=0;i<words.length;i=i+2){
          cell = document.createElement("dt");
          cellText = document.createTextNode(words[i+1]);
          cell.appendChild(cellText);
          row.appendChild(cell);
      }
      return row;
  }

  //**********************************************************************
  
function getClients() {
   
	  let words=[];
	  let url="http://localhost:1649/api/v1/devices/";

          let tblBody=document.getElementById("tabelle");

          let response=httpGet(url);
	
           words=response.split(" ");
	   for(var i=0;i<words.length;i++){
                tblBody.appendChild(makeRow(words[i]));
	    }

       }

	

/*
function fillTable(response){
    //const decoded=atob(response);
    //const obj = JSON.parse(decoded);
    //words=response.split(" ");
    
      let tblBody=document.getElementById("#tabelle");
      for(var j=0;j<obj.length;j++){
	  if(obj[j].hosttype == "laptop"){
	      tblBody.appendChild(makeRow(obj[j].status));
	  }
      }
  }    
*/
  

/*
function parseStatus(response){
    let words=response.split(" ");
    let ret=[];
    for(var i=0;i<words.length();i=i+2){
	ret[words[i]]=words[i+1];    
    }
*/	
	
	
/*
function uhu(response){
    let words;
          words=response.split(" ");
          for(var i=0;i<words.length;i=i+2){
             cell = document.createElement("dt");
             cellText = document.createTextNode(tmp);
             cell.appendChild(cellText);
             row.appendChild(cell);
           }
      return row;

      }
*/
