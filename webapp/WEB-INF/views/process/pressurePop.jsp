<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/donghwa/css/process/pressurePop.css">
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
	   .psp-6 {
	    color: black;
	    text-align: left;
	    font-size: 20px;
	    font-weight: 400;
	    position: absolute;
	    left: 26px;
	    top: 148px;
	    width: 171px;
	    height: 21px;
	}
   </style>
  <title>Document</title>
</head>
<body>
 
    <div class="tem-box"></div>
    <div class="tem-header"></div>
    <div class="tem-main"></div>
   
    <div class="temperature">Pressure</div>
    <div class="fur-pressure"></div>
    <div class="furnace-pressure">Furnace pressure</div>
    <div class="auto">Auto</div>
    <div class="fur-pressure-box-1"></div>
    <div class="pis-6-x-13-5">Furnace Vacuum</div>
    <div class="fur-pressure-val-1 D-7800"></div>
        <div class="fur-pressure-val-1 D-7802"style="display: none;"></div>
    <div class="fur-pressure-box-2"></div>
    <div class="psp-6">Diffusion Vacuum</div>
    <div class="fur-pressure-val-2 D-7810"></div>
        <div class="fur-pressure-val-2 D-7812"style="display: none;"></div>
    <div class="rel"></div>
    <div class="rel-box-1"></div>
    <div class="furnace-pressure-rel">Furnace pressure rel.</div>
    <div class="rel-val-1"></div>
    <div class="pis-13-5-1">PIS 13.5.1</div>
    <div class="high-vacuum"></div>
    <div class="high-vacuum-box-1"></div>
    <div class="high-vacuum2">High-vacuum</div>
    <div class="high-vacuum-val-1"></div>
    <div class="pis-6-25">PIS 6.25</div>
    <div class="fine-vacuum"></div>
    <div class="fine-vacuum-box-1"></div>
    <div class="fine-vacuum2">Fine vacuum</div>
    <div class="fine-vacuum-val-1"></div>s
    <div class="pis-6-27">PIS 6.27</div>
    <div class="fore-vacuum"></div>
    <div class="fore-vacuum-box-1"></div>
    <div class="fore-vacuum2">Fore vacuum</div>
    <div class="fore-vacuum-val-1"></div>
    <div class="pis-6-24">PIS 6.24</div>
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
		url:"/donghwa/furnace/overview/view",
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
    var truncatedValue = Math.floor(value * 10) / 10;

    var finalValue = keys.includes("-rover") ? value : truncatedValue;

    // D11101과 D11102에 대해서는 백분율로 변환
    if (keys === "D11101" || keys === "D11102") {
        finalValue = (value / 100).toFixed(2) + " mm";  // 소숫점 2자리로 나누고 mm 단위 추가
    } else {
        finalValue = (keys === "D11101" || keys === "D11102") ? (value / 100).toFixed(2) : value;
    }
 // D-7800 처리
    if (keys === "D-7800") {
        var d7802Value = parseFloat($(".D-7802").text()) || 0;
        var eValue = "E"; 
        var torrValue = "Torr"; 
        // 0 포함 양수일 경우 + 기호 추가
        var formattedD7802 = d7802Value >= 0 ? "+" + d7802Value : d7802Value;
        var newValue = truncatedValue + " " + eValue + " " + formattedD7802 + " " + torrValue;        
        $("." + keys).text(newValue);
    }

    // D-7810 처리
    else if (keys === "D-7810") {
        var d7812Value = parseFloat($(".D-7812").text()) || 0;
        var eValue = "E"; 
        var torrValue = "Torr"; 
        // 0 포함 양수일 경우 + 기호 추가
        var formattedD7812 = d7812Value >= 0 ? "+" + d7812Value : d7812Value;
        var newValue = truncatedValue + " " + eValue + " " + formattedD7812 + " " + torrValue;        
        $("." + keys).text(newValue);
    }

    // 값이 99이면 "-"로 표시
    else if (value === 99) {
        $("." + keys).text("-");
    }
    // D-7950을 시:분 형식으로 변환
    else if (keys === "D-7950") {
        var hours = Math.floor(value / 60);  // 시간 계산
        var minutes = value % 60;  // 분 계산
        var timeString = hours + ":" + (minutes < 10 ? "0" + minutes : minutes); 
        $("." + keys).text(timeString);
    }
    else if (keys === "D11105" || keys === "D11013") {
        $("." + keys).text(truncatedValue + " kN");
    }
    else if (keys === "overTb1" || keys === "overTb2") {
        $("." + keys).text(truncatedValue + " °C");
    }

    else {
        $("." + keys).text(finalValue);
    }

    $("." + keys).css("text-align", "center");
    $("." + keys).css("font-size", "14pt");
}



</script>  
</body>
</html>