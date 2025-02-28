<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/donghwa/css/process/pressPop.css">
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
 

    <div class="press-box"></div>
    <div class="press-header"></div>
    <div class="press-main"></div>

    <div class="press		">Press</div>
    <div class="press-cap"></div>
    <div class="press-capacity">Press capacity</div>
    <div class="press-cap-box-1"></div>
    <div class="auto">Auto</div>
    <div class="wic-22-4-2-x">Current Load</div>
    <div class="press-cap-val-1 D11105"></div>
    <div class="press-cap-box-2"></div>
    <div class="wsp-22-4-2-x">Set Load</div>
    <div class="press-cap-val-2 D11013	"></div>
    <div class="force-sensor"></div>
    <div class="force-sensor2">Force sensor</div>
    <div class="force-sensor-box-1"></div>
    <div class="wic-22-4-2-1 ">Load censor1</div>
    <div class="force-sensor-val-1 D7981"></div>
    <div class="force-sensor-box-2"></div>
    <div class="wic-22-4-2-2">Load censor2</div>
    <div class="force-sensor-val-2 D7982"></div>
    <div class="force-sensor-box-3"></div>
    <div class="wic-22-4-2-3">Load censor3</div>
    <div class="force-sensor-val-3 D7983"></div>
    <div class="force-sensor-box-4"></div>
    <div class="wic-22-4-2-4">Load censor4</div>
    <div class="force-sensor-val-4 D7984"></div>
    <div class="force-sensor-box-5"></div>
    <div class="wic-22-4-2-5">Load censor5</div>
    <div class="force-sensor-val-5 D7985"></div>
    <div class="force-sensor-box-6"></div>
    <div class="wic-22-4-2-6">Load censor6</div>
    <div class="force-sensor-val-6 D7986"></div>
    <div class="force-sensor-box-7 "></div>
    <div class="wic-22-4-2-7">Load censor7</div>
    <div class="force-sensor-val-7 D7987"></div>
    <div class="force-sensor-box-8"></div>
    <div class="wic-22-4-2-8 ">Load censor8</div>
    <div class="force-sensor-val-8 D7988"></div>
    <div class="tara"></div>
    <div class="tara-box-1"></div>
    <div class="tara2">Tara</div>
    <div class="tara-val-1"></div>
    <div class="tara-ok"></div>
    <div class="_5"></div>
    <div class="tara-ok2">Tara Ok</div>
    <div class="position-1"></div>
    <div class="auto2">Auto</div>
    <div class="position">Position</div>
    <div class="position-box-1"></div>
    <div class="gic-22-2-60-10">GIC 22.2.60.10</div>
    <div class="position-val-1 D11101"></div>
    <div class="position-box-2"></div>
    <div class="gsp-22-2-60-10">GSP 22.2.60.10</div>
    <div class="position-val-2 D11102"></div>
    <div class="position2"></div>
    <div class="position3">Position</div>
    <div class="position-box-3"></div>
    <div class="gic-22-1-60-20">GIC 22.1.60.20</div>
    <div class="position-val-3"></div>
    <div class="ref-point"></div>
    <div class="ref-point2">Reference Point</div>
    <div class="ref-point-box-1"></div>
    <div class="start">Start</div>
    <div class="ref-point-val-1"></div>
    <div class="ref-point-box-2"></div>
    <div class="actual">Actual</div>
    <div class="ref-point-val-2"></div>
    <div class="mid-box-1"></div>
    <div class="_1"></div>
    <div class="extrusion-die-in-upper-position">
      Extrusion die in upper Position
    </div>
    <div class="mid-box-2"></div>
    <div class="_2"></div>
    <div class="reference-point-latched">Reference Point Latched</div>
    <div class="mid-box-3"></div>
    <div class="_3"></div>
    <div class="batch-reached">Batch Reached</div>
    <div class="mid-box-4"></div>
    <div class="_4"></div>
    <div class="alternating-force-active">Alternating Force Active</div>
    <div class="pressure"></div>
    <div class="pressure-box-1"></div>
    <div class="hydraulic-oil-system-pressure">
      Hydraulic Oil System Pressure
    </div>
    <div class="pressure-val-1"></div>
    <div class="pi-22-1-51-1">PI 22.1.51.1</div>
    <div class="a-1"></div>
    <div class="a-1-box-1"></div>
    <div class="hydraulic-pressure-cylinder-a-1">
      Hydraulic pressure cylinder A1
    </div>
    <div class="a-1-val-1"></div>
    <div class="pi-22-1-51-2">PI 22.1.51.2</div>
    <div class="a-2"></div>
    <div class="a-2-box-1"></div>
    <div class="hydraulic-pressure-cylinder-a-2">
      Hydraulic pressure cylinder A2
    </div>
    <div class="a-2-val-1"></div>
    <div class="pi-22-1-51-3">PI 22.1.51.3</div>
    <div class="b-1"></div>
    <div class="b-1-box-1"></div>
    <div class="hydraulic-pressure-cylinder-b-1">
      Hydraulic pressure cylinder B1
    </div>
    <div class="b-1-val-1"></div>
    <div class="pi-22-1-51-4">PI 22.1.51.4</div>
    <div class="b-2"></div>
    <div class="b-2-box-1"></div>
    <div class="hydraulic-pressure-cylinder-b-2">
      Hydraulic pressure cylinder B2
    </div>
    <div class="b-2-val-1"></div>
    <div class="pi-22-1-51-5">PI 22.1.51.5</div>
    <div class="tem"></div>
    <div class="tem-box-1"></div>
    <div class="hydraulic-oil-temperature">Hydraulic Oil Temperature</div>
    <div class="tem-val-1"></div>
    <div class="tis-22-1-5-1">TIS 22.1.5.1</div>
    <div class="level"></div>
    <div class="level-box-1"></div>
    <div class="hydraulic-oil-fill-level">Hydraulic Oil Fill Level</div>
    <div class="level-val-1"></div>
    <div class="wis-22-1-5-1">WIS 22.1.5.1</div>

<script>

var overviewInterval;

//로드
$(function(){
	overviewListView();
	overviewInterval = setInterval("overviewListView()", 500);
});

//OPC값 알람 조회
function overviewListView(){
	$.ajax({
		url:"/donghwa/process/press/view",
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
					}else if(d[keys].action == "value"){
						value(keys, d[keys].value);
					}

        	}                    	
        }
		}
	});
}

function v(keys, value){
	
	if(value == true){
		$("."+keys).css("background-color","green");
		$("."+keys).css("color","white");
	}else{
		$("."+keys).css("background-color","#E3E3E3");
		$("."+keys).css("color","black");
	}

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

function value(keys, value) {
    var finalValue = (keys === "D11101" || keys === "D11102") ? (value / 100).toFixed(2) : value;
	$("."+keys).text(value);
    $("." + keys).text(finalValue);  // 수정된 값 적용
    $("." + keys).css("text-align", "center");
    $("." + keys).css("font-size", "17pt");
}


</script>  
 
</body>
</html>