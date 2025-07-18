<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/donghwa/css/process/temperaturePop.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
   
   
	   .load-box-2 {
	  background: #ffffff;
	  width: 180px;
	  height: 31px;
	  position: absolute;
	  left: 18px;
	  top: 451px;
	}
	.ti-4-62 {
	  color: #000000;
	  text-align: left;
	  font-family: "Inter-Regular", sans-serif;
	  font-size: 21px;
	  font-weight: 400;
	  position: absolute;
	  left: 26px;
	  top: 455px;
	  width: 109px;
	  height: 21px;
	}
	.load-val-2 {
	  background: #ffffff;
	  width: 256px;
	  height: 31px;
	  position: absolute;
	  left: 199px;
	  top: 451px;
	}
   </style>
  <title>Document</title>
</head>
<body>
  
 
  <div class="tem-box"></div>
  <div class="tem-header"></div>
  <div class="tem-main"></div>

 <div class="temperature">Temperature</div>
  <div class="cz-1"></div>
  <div class="heater-bottom-top-cz-1">Heater 1Zone Left/Right</div>
  <div class="cz-1-box-1"></div>
  <div class="tic-4-1-1">Zone 1</div>
  <div class="cz-1-val-1"></div>
  <div class="cz-1-box-2"></div>
  <div class="tic-4-1-2">Zone 2</div>
  <div class="cz-1-val-2"></div>
  <div class="cz-3"></div>
  <div class="heater-doors-cz-3">Heater 2Zone Front/Rear</div>
  <div class="cz-3-box-1"></div>
  <div class="tic-4-3-1">Zone 2.1</div>
  <div class="cz-3-val-1"></div>
  <div class="cz-3-box-2"></div>
  <div class="tic-4-3-2">Zone 2.2</div>
  <div class="cz-3-val-2"></div>
  <div class="cz-5"></div>
  <div class="heater-walls-cz-5">Heater 3Zone Bottom/Top</div>
  <div class="cz-5-box-1"></div>
  <div class="tic-4-5-1">Zone 3.1</div>
  <div class="cz-5-val-1"></div>
  <div class="cz-5-box-2"></div>
  <div class="tic-4-5-2">Zone 3.2</div>
  <div class="cz-5-val-2"></div>
  <div class="load"></div>
  
  <div class="load2">Protect</div>
  <div class="load-box-1"></div>
  <div class="ti-4-61">Protect 1.1</div>
  <div class="load-val-1"></div>
  
  <div class="load-box-2"></div>
  <div class="ti-4-62">Protect 1.2</div>
  <div class="load-val-2"></div>
  
  <div class="charge"></div>
  <div class="charge-box-1"></div>
  <div class="charge-val-1"></div>
  <div class="charge-box-2"></div>
  <div class="charge-box-22"></div>
  
  <div class="t-c-11-c-t-c-25-c">Current Temp Load 1~15</div>
  
  <div class="ti-4-27">Load-2</div>
  <div class="charge-box-23"></div>
  <div class="ti-4-272">Load-1</div>
  <div class="charge-val-2"></div>
  <div class="charge-box-3"></div>
  <div class="ti-4-28">Load-3</div>
  <div class="charge-val-3"></div>
  <div class="charge-box-4"></div>
  <div class="ti-4-29">Load-4</div>
  <div class="charge-val-4"></div>
  <div class="charge-box-42"></div>
  <div class="ti-4-292">Load-5</div>
  <div class="charge-val-42"></div>
  <div class="charge-box-12"></div>
  <div class="ti-4-26">Load-6</div>
  <div class="charge-val-12"></div>
  <div class="charge-box-24"></div>
  <div class="ti-4-273">Load-7</div>
  <div class="charge-val-22"></div>
  <div class="charge-box-32"></div>
  <div class="ti-4-282">Load-8</div>
  <div class="charge-val-32"></div>
  <div class="charge-box-43"></div>
  <div class="ti-4-293">Load-9</div>
  <div class="charge-val-43"></div>
  <div class="charge-box-44"></div>
  <div class="ti-4-294">Load-10</div>
  <div class="charge-val-44"></div>
  <div class="charge-box-13"></div>
  <div class="ti-4-262">Load-11</div>
  <div class="charge-val-13"></div>
  <div class="charge-box-25"></div>
  <div class="ti-4-274">Load-12</div>
  <div class="charge-val-23"></div>
  <div class="charge-box-33"></div>
  <div class="ti-4-283">Load-13</div>
  <div class="charge-val-33"></div>
  <div class="charge-box-45"></div>
  <div class="ti-4-295">Load-14</div>
  <div class="charge-val-45"></div>
  <div class="charge-box-46"></div>
  <div class="ti-4-99">Load-15</div>
  <div class="charge-val-46"></div>


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
		url:"/donghwa/process/temperaturePop/view",
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

	$("."+keys).attr("onclick","digitalSet('DONGHWA.PROCESS_VALUES.TEMPERATURE','"+keys+"')");
	$("."+keys).css("cursor","pointer");
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
    var finalValue = value + " °C"; 
    $("." + keys).text(finalValue);
    $("." + keys).css("text-align", "center");
    $("." + keys).css("font-size", "17pt");
}


</script>  
  
</body>
</html>