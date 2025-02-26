<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@ include file="../include/mainHeader.jsp" %>
  <%@ include file="../include/mainFooter.jsp" %>
  <jsp:include page="../include/pluginpage.jsp"/>
  <link rel="stylesheet" href="/donghwa/css/furnace/overview.css">
  <%@ include file="../include/commonPopupMain.jsp" %>
  <style>
    a, button, input, select, h1, h2, h3, h4, h5, * {
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

    body {
        display: flex;
        justify-content: center;
        align-items: flex-start;
        height: 100vh;
        background-color: #E2E2E2;
    }

    .table-container {
        position: absolute;
        top: 190px;
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        grid-template-rows: repeat(2, 1fr);
        gap: 27px;
        width: 35%;
        left: 511px; 
    }


    .table3-container {
        position: absolute;
        
        display: grid;
        grid-template-columns: repeat(1, 1fr);
        grid-template-rows: repeat(1, 1fr);
        gap: 27px;
        width: 200px;
        left: 511px; 
    }
    .table {
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: auto 1fr;
        width: 100%;
  
        border: 1px solid #ccc;
        border-radius: 8px;
    }

    .table-header {
        color: black;
        padding: 10px;
        text-align: center;
        font-size: 1.2em;
        font-weight: bold;
        grid-column: span 2;
    }

    .table1 .table-header {
        background-color: #f1a7b2;
    }

    .table2 .table-header {
        background-color: #109010;
    }

    .table3 .table-header {
        background-color: #7aaedc;
    }

    .table4 .table-header {
        background-color: #109010;
    }
	.pop_btn{
	    width: 100px;
        height: 100px;
        position: absolute;
        top: 50%;
        left: 50%;
	}

.capacity_3{
 		background-color: white;
        border-top: 1px solid #ccc;
        padding: 10px;
        text-align: center;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 19px;
        text-align: center;
		}

	
.table1 .table-cell,
    .table2 .table-cell,
    .table3 .table-cell,
    .table4 .table-cell,
  
    .table1 .temper_1, .table1 .temper_2,
    .table2 .Position_1, .table2 .Position_2,
    .table3 .Pressure_1, .table3 .Pressure_2,
    .table4 .capacity_1, .table4 .capacity_2 {
        background-color: white;
        border-top: 1px solid #ccc;
        padding: 10px;
        text-align: center;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 21px;
        text-align: center;
    }

  .table-container2 {
        display: grid;
        grid-template-columns: 1fr; /* 1개의 열로 설정하여 수직 배치 */
        gap: 10px;
     	width: 200px;
        height: 180px;
        
        position: absolute;
        top: 673px;
        left: 1266px;
        font-size:12px;
    }



    .table-header {
        background-color: #7aaedc; /* 헤더 색상 */
        padding: 15px;
        text-align: center;
        font-size: 18px;
        font-weight: bold;
    }

    .table .capacity_1, .table .capacity_2, .table .Temperature, .table .Fore-vacuum {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 10px;
        font-size: 20px;
        text-align: center;
        background-color: white;
    }

    .table7 .table-header {
        background-color: #7aaedc; 
     
    }

    .table8 .table-header {
        background-color: #7aaedc; 
    }
    
	.heater1 {
	    position: absolute;
	    left: 833px;
	    top: 672px;
	    transform: translateY(-50%);
	    height: 8px;
	    background-color: #868296;
	    width: 74px;
	    z-index: 9999;
	}
	
	.heater2 {
	    position: absolute;
	    left: 935px;
	    top: 672px;
	    transform: translateY(-50%);
	    height: 8px;
	    background-color: #868296;
	    width: 77px;
	    z-index: 9999;
	}
	
		.heater3 {
	    position: absolute;
	    left: 834px;
	    top: 822px;
	    transform: translateY(-50%);
	    height: 8px;
	    background-color: #868296;
	    width: 74px;
	    z-index: 9999;
	}
	
		.heater4 {
	    position: absolute;
	    left: 936px;
	    top: 822px;
	    transform: translateY(-50%);
	    height: 8px;
	    background-color: #868296;
	    width: 77px;
	    z-index: 9999;
	}
		.g-box3 {
	    width: 80px;
	    height: 90px;
	    background-color: #E2E2E2;
	    left: 1080px;
	    top: 892px;
	    position: absolute;
	    z-index: 9999;
	}

	
		.g-box2 {
	    width: 80px;
	    height: 78px;
	    background-color: #E2E2E2;
	    left: 1030px;
	    top: 852px;
	    position: absolute;
	    z-index: 9999;
    
    }
	.tx{
	font-size: 18px; 
	}
	
	.table1:hover {
	    background-color: #f9e5eb;
	    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
	    transform: scale(1.04);
	    border: 2px solid #f29b9b;
	    transition: all 0.2s ease;
	    cursor: pointer;
	}
	
	.table2:hover {
	    background-color: #e5f7e0;
	    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
	    transform: scale(1.04);
	    border: 2px solid #74e174;
	    transition: all 0.2s ease;
	    cursor: pointer;
	}
	
	.table3:hover {
	    background-color: #e0f1fb;
	    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
	    transform: scale(1.04);
	    border: 2px solid #89c2fb;
	    transition: all 0.2s ease;
	    cursor: pointer;
	}
	
	.table4:hover {
	    background-color: #e5f7e0;
	    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
	    transform: scale(1.04);
	    border: 2px solid #74e174;
	    transition: all 0.2s ease;
	    cursor: pointer;
	}
	
	.ball-red-1-img {
	    position: absolute;
	    top: 683px;
	    left: 1511px;
	    width: 74px;
	    height: 74px;
	    background-color: red;
	    border-radius: 50%;
	}
	
	.ball-red-2-img {
	  position: absolute;
	   top: 888px;
	    left: 1511px;
	    width: 74px;
	    height: 74px;
	    background-color: red;
	    border-radius: 50%;
	}
	
	.ball-red-3-img {
	    position: absolute;
	    top: 973px;
	    left: 1511px;
	    width: 74px;
	    height: 74px;
	    background-color: red;
	    border-radius: 50%;
	}
		

  </style>

  <title>Document</title>
</head>
<body>

 
  <div class="table-container">
  
  
	 <div class="table table1" onclick="popupClick('/donghwa/process/temperaturePop', 779, 498, 450, 165);">
	  <div class="table-header">Furance temperature     Auto</div>
	  <div class="temper_1">TIC 4.x</div>
	  <div class="table-cell overTb1">79°C</div>
	  <div class="temper_2">TSP 4</div>
	  <div class="table-cell overTb2">20°C</div>
	</div>


    <div class="table table2" onclick="popupClick('/donghwa/process/pressPop', 940, 490, 450, 160);">
      <div class="table-header">Position</div>
      <div class="Position_1">GIC 22.260.10</div>
      <div class="table-cell overTb3">1.16 mm</div>
      <div class="Position_2">GSP 22.260.10</div>
      <div class="table-cell overTb4">0.00 mm</div>
    </div>
 	
    <div class="table table3"  onclick="popupClick('/donghwa/process/pressurePop', 391, 441, 680, 180);">
      <div class="table-header">Furnace Pressure</div>
      <div class="Pressure_1">PIS 6.x / 13.5</div>
      <div class="table-cell D-7800"> mbar</div>
      <div class="Pressure_2">PSP 6</div>
      <div class="table-cell D-7810"> mabar</div>	
    </div>

    <div class="table table4" onclick="popupClick('/donghwa/process/pressPop', 940, 490, 450, 160);">
      <div class="table-header">Press capacity</div>
      <div class="capacity_1">WIC 22.4.2 X</div>
      <div class="table-cell overTb7">-5 kN</div>
      <div class="capacity_2">WSC 22.4.2 X</div>
      <div class="table-cell overTb8">0 kN</div>
    </div>
  </div>
  
 <div class="text18" >
  <div class="D-7802">D-7802</div>

  <div class="D-7812">D-7812</div>

 </div>>


   <div class="table-container2">
    
     <div class="table2 table7" onclick="popupClick('/donghwa/process/pressurePop', 391, 441, 680, 180);">
      <div class="table-header">High-vacuum</div>
      
      <div class="capacity_3 D-7800">-- kN</div>
    </div>
    
    
    <div class="table2 table8" onclick="popupClick('/donghwa/process/pressurePop', 391, 441, 680, 180);">
      <div class="table-header">Fore-vacuum</div>
     
      <div class="capacity_3 D-7810">--</div>
    </div>
 </div>

   <div class="g-box"></div>
   <div class="g-box2"></div>
   <div class="g-box3"></div>
   
   
   <div class="heater1 heaterView lamp-8030"></div>
   <div class="heater2 heaterView lamp-8030"></div>
   <div class="heater3 heaterView lamp-8030"></div>
   <div class="heater4 heaterView lamp-8030"></div>

   
 
    <div class="base-1"></div>
    <div class="press-rec-1"></div>
    <div class="press-rec-2"></div>
    <div class="obj-1"></div>
    <div class="obj-2"></div>
    <div class="obj-3"></div>
    <div class="obj-4"></div>
    <div class="obj-line-1"></div>
    <div class="obj-line-2"></div>
    <div class="obj-line-3"></div>
    <div class="obj-line-4"></div>
    <div class="component-1">
      <div class="pillar-rec-1"></div>
      <img class="pillar-1" src="/donghwa/css/furnace/img/pillar-10.png" />
    </div>
    <div class="component-2">
      <div class="pillar-rec-2"></div>
      <img class="pillar-2" src="/donghwa/css/furnace/img/pillar-20.png" />
    </div>
    <img class="component-3 Ldclose" src="/donghwa/css/furnace/img/component-30.svg" />
    <img class="component-4 Ldopen" src="/donghwa/css/furnace/img/component-40.svg" />
    <div class="value-1 tx">12.2</div>
    <div class="value-2 tx">12.2</div>
    <div class="value-3 tx">6.1</div>
    <div class="value-4 tx">6.2</div>
    <div class="value-5 tx">6.14</div>
    <div class="value-6 tx">6.4</div>
    <div class="value-7 tx">6.10</div>
    <div class="value-8 tx">6.12</div>
    <div class="value-9 tx">13.4</div>
    <div class="value-10 tx">13.704</div>
    <div class="value-11 tx">13.102</div>
    <div class="value-12 tx">Air</div>
    <div class="value-13 tx">Ar</div>
    <img class="component-5 Rdclose" src="/donghwa/css/furnace/img/component-50.svg" />
    <img class="component-6 Rdopen" src="/donghwa/css/furnace/img/component-60.svg" />
  
    <img class="vector-1 Lcopen" src="/donghwa/css/furnace/img/vector-10.svg" />
    <img class="vector-2 Lcclose" src="/donghwa/css/furnace/img/vector-20.svg" style="background-color: green;" />
    <img class="vector-3 Lcopen" src="/donghwa/css/furnace/img/vector-30.svg" />
    <img class="vector-4 Lcclose" src="/donghwa/css/furnace/img/vector-40.svg" style="background-color: green;" />
   
    <img class="vector-5 Rcclose" src="/donghwa/css/furnace/img/vector-10.svg" />
    <img class="vector-6 Rcopen" src="/donghwa/css/furnace/img/vector-20.svg"style="background-color: green;" />
    <img class="vector-7 Rcclose" src="/donghwa/css/furnace/img/vector-30.svg" />
    <img class="vector-8 Rcopen" src="/donghwa/css/furnace/img/vector-40.svg"style="background-color: green;" />
    
    <div class="pipe-1"></div>
    <div class="pipe-2"></div>
    <div class="pipe-3"></div>
    <div class="pipe-4"></div>
    <div class="pipe-5"></div>
    <div class="pipe-6"></div>
    <div class="pipe-7"></div>
    <div class="pipe-8"></div>
    <div class="pipe-9"></div>
    <div class="pipe-10"></div>
    <div class="pipe-11"></div>
    <div class="pipe-12"></div>
    <div class="pipe-13"></div>
    <div class="pipe-14"></div>
    <div class="pipe-15"></div>
    <img class="component-7 " src="/donghwa/css/furnace/img/component-70.svg" />
    <img class="component-8 component-8-img" src="/donghwa/css/furnace/img/component-80.svg" />
    <img class="component-9" src="/donghwa/css/furnace/img/component-90.svg" />
    <img class="component-10 component-10-img" src="/donghwa/css/furnace/img/component-100.svg" />
    <img class="component-11" src="/donghwa/css/furnace/img/component-110.svg" />
    <img class="component-12 component-12-img" src="/donghwa/css/furnace/img/component-120.svg" />
    <img class="component-13" src="/donghwa/css/furnace/img/component-130.svg" />
    <img class="component-14 component-14-img" src="/donghwa/css/furnace/img/component-140.svg" />
    <img class="component-15" src="/donghwa/css/furnace/img/component-150.svg" />
    <img class="component-16 component-16-img" src="/donghwa/css/furnace/img/component-160.svg" />
    <div class="ball-off-1"></div>
    <div class="ball-on-1 ball-on-1-img"></div>
    <div class="ball-off-2"></div>
    <div class="ball-on-2 ball-on-2-img"></div>
    <div class="ball-off-3"></div>
    <div class="ball-on-3 ball-on-3-img"></div>
    
    <div class="ball-red-1-img"></div>
    <div class="ball-red-2-img"></div>
    <div class="ball-red-3-img"></div>
    <!-- <div class="ball-line-1"></div>
    <div class="ball-line-2"></div>
    <div class="ball-line-3"></div>
    <div class="ball-line-4"></div>
    <div class="ball-line-5"></div>
    <div class="ball-line-6"></div>
    <div class="ball-line-7"></div>
    <div class="ball-line-8"></div>
    <div class="ball-line-9"></div>
    <div class="ball-line-10"></div>
    <div class="ball-line-11"></div>
    <div class="ball-line-12"></div>
    <div class="ball-line-13"></div>
    <div class="ball-line-14"></div>
    <div class="ball-line-15"></div>
    <div class="ball-line-16"></div> -->
    <img class="arrow-1" src="/donghwa/css/furnace/img/arrow-10.svg" />
    <img class="arrow-2" src="/donghwa/css/furnace/img/arrow-20.svg" />
    <img class="arrow-3" src="/donghwa/css/furnace/img/arrow-30.svg" />
    <div class="box-off-1"></div>
    <div class="box-on-1"></div>
   <div class="GreenPen GreenY140"></div>
   <div class="RedPen  RedX0CC"></div>
    <img class="arrow-1" src="/donghwa/css/furnace/img/arrow-10.svg" />

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

	        		 if (d[keys].action == "v") {
	        			 console.log("V 값 확인:", keys, d[keys].value);
	                     v(keys, d[keys].value);
					}else if(d[keys].action == "Ropen"){
						Ropen(keys, d[keys].value);
					}else if(d[keys].action == "Lopen"){
						Lopen(keys, d[keys].value);
					}else if(d[keys].action == "Rclose"){
						Rclose(keys, d[keys].value);
					}else if(d[keys].action == "Lclose"){
						Lclose(keys, d[keys].value);
					}else if(d[keys].action == "img"){
						img(keys, d[keys].value);	
					}else if(d[keys].action == "rover"){
						rover(keys, d[keys].value);	
					}else if(d[keys].action == "lamp"){
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


        if (value === true) {
            $("." + keys).css("background-color", "red"); 
        } else {
            $("." + keys).css("background-color", ""); 
        }

        if (keys === "lamp-8033") {
            if (value === true) {
                $("." + keys).css("background-color", "green");
            } else if (value === false) {
                $("." + keys).css("background-color", "");
            }
            $("."+keys).attr("onclick","digitalSet('DONGHWA.OVERVIEW','"+keys+"')");
        	$("."+keys).css("cursor","pointer");
        }

}




	function img(keys, value) {
	    if (value === true) {
	        $("." + keys).fadeIn(200); 
	    } else {
	        $("." + keys).fadeOut(200); 
	    }
	}
	

function v(keys, value){

    
    if(value === true){
        $("."+keys).css("color", "black");
    }
    
    if (keys === "Ldclose") {
        if (value === true) {
            $("." + keys).css("visibility", "visible");
        } else if (value === false) {
            $("." + keys).css("visibility", "hidden");
        }
    }

    if (keys === "Ldopen") {
        if (value === true) {
            $("." + keys).css("visibility", "hidden");
        } else if (value === false) {
            $("." + keys).css("visibility", "visible");
        }
    }

    if (keys === "Rdclose") {
        if (value === true) {
            $("." + keys).css("visibility", "visible");
        } else if (value === false) {
            $("." + keys).css("visibility", "hidden");
        }
    }

    if (keys === "Rdopen") {
        if (value === true) {
            $("." + keys).css("visibility", "hidden");
        } else if (value === false) {
            $("." + keys).css("visibility", "visible");
        }
    }

    if (keys === "Lcclose") {
        if (value === true) {
            $("." + keys).css("visibility", "visible");
        } else if (value === false) {
            $("." + keys).css("visibility", "hidden");
        }
    }

    if (keys === "Lcopen") {
        if (value === false) {
            $("." + keys).css("visibility", "visible");
        } else if (value === true) {
            $("." + keys).css("visibility", "hidden");
        }
    }

 
    if (keys === "Rcopen") {
        if (value === true) {
            $("." + keys).css("visibility", "visible");
        } else if (value === false) {
            $("." + keys).css("visibility", "hidden");
        }
    }


    if (keys === "Rcclose") {
        if (value === false) {
            $("." + keys).css("visibility", "visible");
        } else if (value === true) {
            $("." + keys).css("visibility", "hidden");
        }
    }
    if (keys === "heaterView") {
        if (value === 1) {
            $("." + keys).css("color", "red");  
        } else {
            $("." + keys).css("color", ""); 
        }
        
    }

    const colorMapping = {
    	    "RedX0CC": "red",
    	    "GreenY140": "green"
    	};

    	if (keys in colorMapping) {
    	    if (value === true) {
    	        $("." + keys).css({
    	            "background-color": colorMapping[keys],
    	            "display": "block",
    	            "z-index": "9999" 
    	        });
    	    } else {
    	        $("." + keys).css({
    	            "background-color": "",
    	            "z-index": ""
    	        });
    	    }
    	}

}



function value(keys, value){

	if(keys.indexOf("D-") != -1){
	    var truncatedValue = Math.floor(value * 10) / 10;
	   
	    // D-7800 처리
	    if (keys === "D-7800") {
	
	        var d7802Value = parseFloat($(".D-7802").text()) || 0;
	
	        var eValue = "E"; 
	        var torrValue = "Torr"; 
	        var newValue = truncatedValue  + " " + eValue + " " + d7802Value  +" " + torrValue ;        
	        $("."+keys).text(newValue);
	    }
	    // D-7810 처리
	    else if (keys === "D-7810") {
	
	        var d7812Value = parseFloat($(".D-7812").text()) || 0;
	
	        var eValue = "E"; 
	        var torrValue = "Torr"; 
	        var newValue = truncatedValue  + " " + eValue + " " + d7812Value  +" " + torrValue ;        
	        $("."+keys).text(newValue);
	    }
	    else {
	        $("."+keys).text(truncatedValue);
	    }
	}
	$("."+keys).text(value);
    $("."+keys).css("text-align", "center");
    $("."+keys).css("font-size", "14pt");

}




function popupClick(url, popupWidth, popupHeight, customLeft, customTop) {
    var popup = window.open(
        url,
        "popupWindow" + popups.length,
        "width=" + popupWidth + 
        ",height=" + popupHeight + 
        ",left=" + customLeft + 
        ",top=" + customTop + 
        ",menubar=no,toolbar=no,scrollbars=no,status=no,location=no,directories=no,resizable=no"
    );

    if (!popup || popup.closed || typeof popup.closed == "undefined") {
        alert("팝업이 차단되었습니다. 팝업 차단 설정을 확인해주세요.");
    } else {
        popups.push(popup);
    }
}

</script>  
</body>
</html>
