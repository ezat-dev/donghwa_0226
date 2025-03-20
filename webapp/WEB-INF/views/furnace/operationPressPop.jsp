<%@ page session="true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/donghwa/css/furnace/operationPressPop.css">
  <jsp:include page="../include/commonPopupPress.jsp"/>
   <jsp:include page="../include/pluginpage.jsp"/>

  
  
  <style>
   a,
   button,
   input,
   select,
   h1,
   h2,
   h3,
   h4,
   h5,
   * {
       box-sizing: border-box;
       margin: 0;
       padding: 0;
       border: none;
       text-decoration: none;
       background: none;
   
       -webkit-font-smoothing: antialiased;
   }
   
   menu, ol, ul {
       list-style-type: none;
       margin: 0;
       padding: 0;
   }
   </style>
  <title>Document</title>
</head>
<body>
 
    <div class="operation-press-box"></div>
    <div class="operation-press-header"></div>
    <div class="operation-press-main"></div>

    <div class="operation-press">Operation Press</div>
    <div class="hydraulic M8180"></div>
    <div class="_1 lamp-M8180"></div>
    <div class="hydraulic2">Hydraulic</div>
    <div class="press-move-up M8181"></div>
    <div class="_2 lamp-M8181"></div>
    <div class="press-move-up2 ">Press Move Up</div>
    <div class="force-f-1 M8182"></div>
    <div class="_3 lamp-M8182"></div>
    <div class="pressing-with-force-f-1">Press Move Down</div>
    <div class="force-f-2"></div>
    <div class="_4"></div>
    <div class="pressing-with-force-f-2">Pressing with Force F1</div>
    <div class="position-dc"></div>
    <div class="_5"></div>
    <div class="position-distance-control">Position-/ Distance Control</div>
    <div class="zero-scale"></div>
    <div class="_6"></div>
    <div class="press-zero-scale">Press Zero Scale</div>
    <div class="set-abs-point"></div>
    <div class="_7"></div>
    <div class="set-absolutzero-point">set absolutzero point</div>
    <div class="cylinder"></div>
    <div class="_8"></div>
    <div class="hydraulic-cylinder-synch">Hydraulic cylinder synch</div>
  
<script>

var overviewInterval;

//로드
$(function(){
	overviewListView();
	overviewInterval = setInterval("overviewListView()", 500);
});

function overviewListView(){
	$.ajax({
		url:"/donghwa/furnace/operationPressPop/view",
		type:"post",
		dataType:"json",
		success:function(result){				
			var data = result.multiValues;
			
			for(let key in data){
				for(let keys in data[key]){
					var d = data[key];

					if(d[keys].action == "v"){
						v(keys, d[keys].value);
					}else if(d[keys].action == "c"){
						c(keys, d[keys].value);
					}else if(d[keys].action == "b"){
						b(keys, d[keys].value);
					}else if (d[keys].action == "lamp") {
						lamp(keys, d[keys].value);
					}else if(d[keys].action == "value"){ 
						value(keys, d[keys].value);
					}
				}                    	
			}
		}
	});
}

function lamp(keys, value) {

    if (value == true) {
        $("." + keys).css("background-color", "green"); 
    } else {
        $("." + keys).css("background-color", ""); 
    }
}


function v(keys, value){
	
	if(value == true){
		$("."+keys).css("color","green");
		$("."+keys).css("color","white");
	}else{
		$("."+keys).css("color","#E3E3E3");
		$("."+keys).css("color","black");
	}
    $("." + keys).attr("onclick", "digitalSet('DONGHWA.FURNACE.OPERATION_PRESS', '"+keys+"')")
   
}

/*
function c(keys, value){
//	$("."+keys).text(value);
	
	if(value == true){
		$("."+keys).css("background-color","red");
		$("."+keys).css("color","white");
	}else{
		$("."+keys).css("background-color","green");
		$("."+keys).css("color","black");
	}
	
}
*/

function value(keys, value){
	$("."+keys).text(value);
	$("."+keys).css("text-align","center");
	$("."+keys).css("font-size","20pt");
	  console.log(`value 함수 호출 - Key: ${key}, Value: ${val}`);
	
}

</script>  
 
</body>
</html>