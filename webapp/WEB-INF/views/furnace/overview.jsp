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
  <%@ include file="../include/OnOffPop.jsp" %>
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
        left: 500px; 
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
        font-size: 17px;
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
        font-size: 17px;
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
	@keyframes blinkOrange {
	    0% {
	        background-color: orange;
	    }
	    50% {
	        background-color: #5A6D8A; 
	    }
	    100% {
	        background-color: orange;
	    }
	}

	@keyframes blinkGreen {
	    0% {
	        background-color: green;
	    }
	    50% {
	        background-color: transparent;
	    }
	    100% {
	        background-color: green;
	    }
	}

	
	.ball-on-60{
	
  	  background: #19a019;
	  border-radius: 50%;
	  border-style: solid;
	  border-color: #000000;
	  border-width: 0.5px;
	  width: 72px;
	  height: 72px;
	  position: absolute;
	  left: 318px;
	  top: 684px;
		
	}
	
	.hover-effect:hover {
	    transform: scale(1.2);
	    transition: transform 0.2s ease;
	}
	
	
	.remove1{
	    width: 75px;
	    height: 30px;
	    background-color: #E2E2E2;
	   
	    position: absolute;
	    top: 756px;
	    right: 854px;
	    z-index: 9999;
	
	}
	
	.remove2{
    width: 25px;
    height: 78px;
    background-color: #E2E2E2;
    /* border: 2px solid black; */
    position: absolute;
    top: 595px;
    right: 924px;
    z-index: 9999;
	
	}
	.square1 {
	    width: 28px;
	    height: 28px;
	    background-color: #E2E2E2;
	    border: 2px solid black;
	    position: absolute;
	    top: 154px;
	    right: 369px;
	    z-index: 9999;
	}
	.square1::after {
	    content: '';
	    width: 4px;
	    height: 12px;
	    background-color: black;
	    position: absolute;
	    bottom: -13px;
	    left: 50%;
	    transform: translateX(-50%);
	}
	
	.square2 {
	    width: 30px;
	    height: 30px;
	    background-color: #E2E2E2;
	    border: 2px solid black;
	    position: absolute;
	    top: 506px;
	    right: 369px;
	    z-index: 9999;
	}
	.square2::after {
	    content: '';
	    width: 4px;
	    height: 12px;
	    background-color: black;
	    position: absolute;
	    bottom: -13px;
	    left: 50%;
	    transform: translateX(-50%);
	}
	
	.value-11 {
	    color: #000000;
	    text-align: left;
	    font-family: "Inter-Bold", sans-serif;
	    font-size: 18px;
	    font-weight: 700;
	    position: absolute;
	    left: 1962px;
	    top: 473px;
	}
	
	.value-11-air {
	    color: #000000;
	    text-align: left;
	    font-family: "Inter-Bold", sans-serif;
	    font-size: 18px;
	    font-weight: 700;
	    position: absolute;
	    left: 1946px;
	    top: 123px;
	}
  </style>

  <title>Document</title>
</head>
<body>

 
  <div class="table-container">
  
  
	 <div class="table table1" onclick="popupClick('/donghwa/process/temperaturePop', 799, 504, 450, 165);">
	  <div class="table-header">Furance temperature     Auto</div>
	  <div class="temper_1">Current Temp.</div>
	  <div class="table-cell overTb1">79°C</div>
	  <div class="temper_2">Set Temp</div>
	  <div class="table-cell overTb2">20°C</div>
	</div>


    <div class="table table2" onclick="popupClick('/donghwa/process/pressPop', 940, 490, 450, 160);">
      <div class="table-header">Position</div>
      <div class="Position_1">Front Press Position</div>
      <div class="table-cell overTb3 D11101">1.16 mm</div>
      <div class="Position_2">Rear Press Position</div>
      <div class="table-cell overTb4 D11102">0.00 mm</div>
    </div>
 	
    <div class="table table3"  onclick="popupClick('/donghwa/process/pressurePop', 391, 441, 680, 180);">
      <div class="table-header">Furnace Pressure</div>
      <div class="Pressure_1">Furnace Vacuum</div>
      <div class="table-cell D-7800"> mbar</div>
      <div class="Pressure_2">Diffusion Pump Vacuum</div>
      <div class="table-cell D-7810"> mabar</div>	

    </div>

    <div class="table table4" onclick="popupClick('/donghwa/process/pressPop', 940, 490, 450, 160);">
      <div class="table-header">Press capacity</div>
      <div class="capacity_1">Current Press Load</div>
      <div class="table-cell overTb7 D11105">-5 kN</div>
      <div class="capacity_2">Set Press Load</div>
      <div class="table-cell overTb8 D11013">0 kN</div>
    </div> 
  </div>
  
 <div class="text18" >
  <div class="D-7802">D-7802</div>

  <div class="D-7812">D-7812</div>

 </div>>


   <div class="table-container2">
    
     <div class="table2 table7" onclick="popupClick('/donghwa/process/pressurePop', 391, 441, 680, 180);">
      <div class="table-header">Furnace Pressure</div>
      
      <div class="capacity_3 D-7800">-- kN</div>
    </div>
    
    
    <div class="table2 table8" onclick="popupClick('/donghwa/process/pressurePop', 391, 441, 680, 180);">
      <div class="table-header">Diff Pump Vacuum</div>
     
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
      <div class="pillar-rec-1 M8029"></div>
      <img class="pillar-1" src="/donghwa/css/furnace/img/pillar-10.png" />
    </div>
    <div class="component-2">
      <div class="pillar-rec-2 M8029"></div>
      <img class="pillar-2" src="/donghwa/css/furnace/img/pillar-20.png" />
    </div>
    <img class="component-3 Ldclose" src="/donghwa/css/furnace/img/component-30.svg" />
    <img class="component-4 Ldopen" src="/donghwa/css/furnace/img/component-40.svg" />
    <div class="value-1 tx">Rear Clamp</div>
    <div class="value-1-1 tx">Front Clamp</div>
    <div class="value-2 tx">12.2</div>
    <div class="value-3 tx">High Valve</div>
    <div class="value-4 tx">Roughing Valve</div>
    <div class="value-5 tx">Diff Pump</div>
    <div class="value-6 tx">F-L Valve</div>
    <div class="value-7 tx">Booster Pump</div>
    <div class="value-8 tx">Rotary Pump</div>
    <div class="value-9 tx">Ar Gas Valve</div>
    <div class="value-10 tx">Vent Valve</div>
    <div class="value-11 tx">Cooling Gas Pressure</div>
    <div class="value-11-air tx">Air Pressure</div>
    <div class="value-12 tx">Air</div>
    <div class="value-13 tx">Ar</div>
    <img class="component-5 Rdclose" src="/donghwa/css/furnace/img/component-50.svg" />
    <img class="component-6 Rdopen" src="/donghwa/css/furnace/img/component-60.svg" />
  
    <img class="vector-1 Lcopen Lcopen-plc-off 	FRONT_CALMP pop-on-fc-M18 pop-off-fc-M20 onClickStatus" src="/donghwa/css/furnace/img/vector-10.svg" />
    <img class="vector-2 Lcclose 3 				FRONT_CALMP pop-on-fc-M18 pop-off-fc-M20 onClickStatus" src="/donghwa/css/furnace/img/vector-20.svg" style="background-color: green;" />
    <img class="vector-3 Lcopen 3 				FRONT_CALMP pop-on-fc-M18 pop-off-fc-M20 onClickStatus" src="/donghwa/css/furnace/img/vector-30.svg" />
    <img class="vector-4 Lcclose 3 				FRONT_CALMP pop-on-fc-M18 pop-off-fc-M20 onClickStatus" src="/donghwa/css/furnace/img/vector-40.svg" style="background-color: green;" />
   
    <img class="vector-5 Rcclose 3 				REAR_CLAMP pop-on-rc-M22 pop-off-rc-M24 onClickStatus" src="/donghwa/css/furnace/img/vector-10.svg" />
    <img class="vector-6 Rcopen Rcopen-plc-off 	REAR_CLAMP pop-on-rc-M22 pop-off-rc-M24 onClickStatus" src="/donghwa/css/furnace/img/vector-20.svg"style="background-color: green;" />
    <img class="vector-7 Rcclose 3 				REAR_CLAMP pop-on-rc-M22 pop-off-rc-M24 onClickStatus" src="/donghwa/css/furnace/img/vector-30.svg" />
    <img class="vector-8 Rcopen 3 				REAR_CLAMP pop-on-rc-M22 pop-off-rc-M24 onClickStatus" src="/donghwa/css/furnace/img/vector-40.svg"style="background-color: green;" />
    
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
    
    <img class="component-7 2 3 						High_Valve pop-on-hv-M12 pop-off-hv-M13 onClickStatus" src="/donghwa/css/furnace/img/component-70.svg" />
   
    <img class="component-8 component-8-img" src="/donghwa/css/furnace/img/component-80.svg" />
    
    <img class="component-9 2 3  			Pumping_valve pop-on-rv-M6 pop-off-rv-M7 onClickStatus" src="/donghwa/css/furnace/img/component-90.svg" />
   
    <img class="component-10 2 3 Pumping_valve pop-on-rv-M6 pop-off-rv-M7 onClickStatus component-10-img" src="/donghwa/css/furnace/img/component-100.svg" />
   
    <img class="component-11 2 3						Fore_Line_Valve	pop-on-fv-M9 pop-off-fv-M10 onClickStatus" src="/donghwa/css/furnace/img/component-110.svg" />
    <img class="component-12 component-12-img 3			Fore_Line_Valve	pop-on-fv-M9 pop-off-fv-M10 onClickStatus" src="/donghwa/css/furnace/img/component-120.svg" />
   
    <img class="component-13 2 3 						Ar_Gas_Value pop-on-asv-M15 pop-off-asv-M16 onClickStatus" src="/donghwa/css/furnace/img/component-130.svg" />
    <img class="component-14 component-14-img 3 	 	  Ar_Gas_Value pop-on-asv-M15 pop-off-asv-M16 onClickStatus" src="/donghwa/css/furnace/img/component-140.svg" />
  
    <img class="component-15 2 3 						Vent_Valve pop-on-vv-M50 pop-off-vv-M51 onClickStatus" src="/donghwa/css/furnace/img/component-150.svg" />
    <img class="component-16 component-16-img  3 	    Vent_Valve pop-on-vv-M50 pop-off-vv-M51 onClickStatus" src="/donghwa/css/furnace/img/component-160.svg" />
   
    <div class="ball-off-1 2 3 							Diff_Pump pop-on-df-M26 pop-off-df-M27 onClickStatus"></div>
    <div class="ball-on-60 2 3 							Diff_Pump pop-on-df-M26 pop-off-df-M27 onClickStatus"></div>
   
    <div class="ball-on-1 2 3 Diff_Pump pop-on-df-M26 pop-off-df-M27 onClickStatus     ball-on-1-img"></div>
   
   
    <div class="ball-off-2 2 3 							Booster_pump pop-on-bp-M0 pop-off-bp-M1 onClickStatus"></div>
    <div class="ball-on-2 2 3 							Booster_pump pop-on-bp-M0 pop-off-bp-M1 onClickStatus  ball-on-2-img"></div>
    
    
    <div class="ball-off-3 2 3 							Rotary_Pump pop-on-rp-M3  pop-off-rp-M4 onClickStatus"></div>
    <div class="ball-on-3 ball-on-3-img 3 				Rotary_Pump pop-on-rp-M3  pop-off-rp-M4 onClickStatus"></div>
    
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
    <div class="GreenPen GreenY140 3 		COOLING_FAN pop-on-cf-M29 pop-off-cf-M30 onClickStatus"></div>
    <div class="RedPen  RedX0CC    3	   		COOLING_FAN pop-on-cf-M29 pop-off-cf-M30 onClickStatus"></div>
    <img class="arrow-1" src="/donghwa/css/furnace/img/arrow-10.svg" />

	  <div class="square1 Air-lamp"></div>
	  <div class="square2 Ar-lamp"></div>
	  
	  <div class="remove1"></div>
	   <div class="remove2"></div>
  <script>

var overviewInterval;
var st1Array = new Array();
var st1Idx = 0;

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
			st1Array = new Array();
			st1Idx = 0;
        for(let key in data){
        	for(let keys in data[key]){
        		var d = data[key];

	        		 if (d[keys].action == "v") {
	    		//		 console.log("V 값 확인:", keys, d[keys].value);
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
			//			 console.log("V 값 확인:", keys, d[keys].value);
						lamp(keys, d[keys].value);
					}else if(d[keys].action == "pop"){
						pop(keys, d[keys].value);
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
	       
	    }
	    
	}

	function pop(keys, value) {
	   
	        $("." + keys).addClass("hover-effect");
	        $("." + keys).css("cursor", "pointer"); 

	}

	function handleClickStatus(event) {
	    var classList = event.currentTarget.className.split(" ");

	 //   console.log("클래스 목록:", classList); // 실제 클래스 목록 확인하기

	    if (classList.length < 6) {
	        console.error("클래스 배열이 충분하지 않습니다.", classList);
	        return;
	    }

	    var popupTitle = classList[3]; // 팝업 제목 (4번째 클래스)
	    var onClass = classList[4]; // ON 버튼 클래스 (5번째 클래스)
	    var offClass = classList[5]; // OFF 버튼 클래스 (6번째 클래스)

	    console.log("Popup Title:", popupTitle); 
	    console.log("ON Button Class:", onClass);
	    console.log("OFF Button Class:", offClass);

	    $("#commonPopup h3").text(popupTitle); // 팝업 제목 설정

	    $(".bt_on").removeClass().addClass("bt_on " + onClass); // ON 버튼 클래스 설정
	    $(".bt_off").removeClass().addClass("bt_off " + offClass); // OFF 버튼 클래스 설정

	    openPopup(); // 팝업 열기
	}


	// 클릭 이벤트 바인딩





	
	function img(keys, value) {
	    if (value === true) {
	        $("." + keys).fadeIn(200);
	    } else {
	        $("." + keys).fadeOut(200);
	    }
	}



/*
    if (value === true) {
        console.log("True case - Showing element for key:", keys);
        $("." + keys).css({
            "visibility": "visible",
            "color": "white !important", 
            "font-size": "20px"          
        });
    } else {
        console.log("False case - Hiding element for key:", keys);
        $("." + keys).css("visibility", "hidden");
    }
*/	

	function asd(){
		for(var i=0; i<st1Idx; i++){
//			console.log(st1Array[i]);

			if(st1Array[i].v == true){
//				$("."+st1Array[i].keys)	
		        $("." + st1Array[i].keys).css({
		            "visibility": "visible",
		            "color": "white !important", 
		            "font-size": "20px"          
		        });
			}else if(st1Array[i].v == false){
				$("." + st1Array[i].keys).css("visibility", "hidden");
			}
		}
	}
	
	
	function v(keys, value) {
	//	console.log("Key:", keys, "Value:", value);
	
	if (keys === "ball-on-60") {
	    //console.log("Triggering styles for .ball-on-60");
	    if (value === true) {
	        $(".ball-on-60").css({
	            "background-color": "green",
	            "animation": "blinkGreen 1s infinite",
	            "z-index": "9999",  // 화면 맨 앞에 보이도록 설정
	            "position": "relative",
	            "display": "block",  // 요소를 화면에 보이도록 설정
	        });
	    } else {
	        $(".ball-on-60").css({
	            "background-color": "",
	            "animation": "",
	            "z-index": "-1",   
	            "position": "",
	            "display": "none",   
	        });
	    }
	}

	if (keys === "Air-lamp" || keys === "Ar-lamp") {
        if (value === true) {
            $("." + keys).css({
                "background-color": "green", 
                "z-index": "9999",             
          
            });
        } else {
            $("." + keys).css({
                "background-color": "",     
                                    
            });
        }
    }



	if (keys === "M8029") {
	    $("." + keys).css({
	        "background-color": value === true ? "green" : "black"
	    });
	}
	    

	    if (keys === "manual-ck") {
	        if (value === true) {
	            $(document).on("click", ".onClickStatus", handleClickStatus);
//	            console.log("Click status enabled for .onClickStatus");
	            
	            $(".onClickStatus").css({
	                "pointer-events": "auto",
	                "cursor": "pointer"
	            });

	            $("." + keys).css({
	                "pointer-events": "auto",
	                "cursor": "pointer"
	            });
	        } else {
	            $(document).off("click", ".onClickStatus", handleClickStatus);
//	            console.log("Click status disabled for .onClickStatus");

	            $(document).off("click", ".onClickStatus");
	            $(document).on("click", ".onClickStatus", function() {
	        
	            });

	            $(".onClickStatus").css({
	                "pointer-events": "none",
	                "cursor": "default"
	            });

	            $("." + keys).css({
	                "pointer-events": "none",
	                "cursor": "default"
	            });
	        }
	    }

	    
	    if (keys.startsWith("ST1-M80")) {
	        let numberPart = parseInt(keys.substring(8));
//	        console.log(numberPart+"// "+keys+"// "+value+"// "+st1Array.length);
//	        console.log(st1Idx);

	        var obj = {
	    	        "numberPart":numberPart,
	    	        "v":value,
	    	        "keys":keys
	    	       }

	        st1Array[st1Idx] = obj;
	        st1Idx++;

			if(st1Idx == 6){
				asd();
			}
	        

	        
	    }



	
	    if (keys.startsWith("ST2-M80")) {
	        let numberPart = parseInt(keys.substring(5));
	        if (numberPart >= 8048 && numberPart <= 8059) {
//	            console.log("Key:", keys, "Value:", value);

	           
	            if (value === true) {
//	                console.log("True case - Showing element for key:", keys);
	                $("." + keys).css({
	                    "visibility": "visible",
	                    "color": "white !important", 
	                    "font-size": "18px"          
	                });
	            } else {
//	                console.log("False case - Hiding element for key:", keys);
	                $("." + keys).css("visibility", "hidden");
	            }
	        }
	    }


	    
	    if (keys.startsWith("ST3-M80")) {
	        let numberPart = parseInt(keys.substring(5));
	        if (numberPart >= 8060 && numberPart <= 8066) {
//	            console.log("Key:", keys, "Value:", value);

	           
	            if (value === true) {
//	                console.log("True case - Showing element for key:", keys);
	                $("." + keys).css({
	                    "visibility": "visible",
	                    "color": "white !important", 
	                    "font-size": "18px"          
	                });
	            } else {
//	                console.log("False case - Hiding element for key:", keys);
	                $("." + keys).css("visibility", "hidden");
	            }
	        }
	    }

	    if (keys === "ST2-M8138") {
	        if (value === true) {
	            $("." + keys).css({
	                "visibility": "visible",
	                "color": "white", 
	                "font-size": "18px"
	            });
	        } else {
	            $("." + keys).css("visibility", "hidden");
	        }
	    }

	  
	 // M8013~M8017에 대한 표시/숨김 처리
	    var targetKeys = ["M8013", "M8014", "M8015", "M8016", "M8017"];

	    if (targetKeys.includes(keys)) {
	        if (value === true) {
	            $("." + keys).show();  // 보여줌
	        } else {
	            $("." + keys).hide();  // 숨김
	        }
	    }
	    
	    	
	    
	    	
	    
	    	    


	    if (value === true) {
	        
	    }

	    if (keys === "M8034") {
	        if (value === true) {
	            $("." + keys).css({
	                "animation": "blinkOrange 2s infinite"
	            });
	        } else {
	            $("." + keys).css({
	                "background-color": "",
	                "animation": ""
	            });
	        }
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

	    var colorMapping = {
	        "RedX0CC": "red",
	        "GreenY140": "green"
	    };

	    if (keys in colorMapping) {
	        if (value === true) {
	            $("." + keys).css({
	                "background-color": colorMapping[keys],
	                "display": "block",
	                "z-index": "555"
	            });
	        } else {
	            $("." + keys).css({
	                "background-color": "",
	                "z-index": ""
	            });
	        }
	    }
	}


    $(document).on('click', '.bt_pause', function () {
        popupClick('/donghwa/furnace/automaticProgramPop2', 508, 392, 730, 235);
    });

    function popupClick(url, popupWidth, popupHeight, customLeft, customTop) {
        const popup = window.open(
            url,
            "popupWindow",
            "width=" + popupWidth +
            ",height=" + popupHeight +
            ",left=" + customLeft +
            ",top=" + customTop +
            ",menubar=no,toolbar=no,scrollbars=no,status=no,location=no,directories=no,resizable=no"
        );

        if (!popup || popup.closed || typeof popup.closed == "undefined") {
            alert("팝업이 차단되었습니다. 팝업 차단 설정을 확인해주세요.");
        }
    }

	

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
/* 	    // D-7950을 시:분 형식으로 변환
	    else if (keys === "D-7950") {
	        var hours = Math.floor(value / 60);  // 시간 계산
	        var minutes = value % 60;  // 분 계산
	        var timeString = hours + ":" + (minutes < 10 ? "0" + minutes : minutes); 
	        $("." + keys).text(timeString);
	    } */

	 // D-7950을 한글 시:분:초 형식으로 변환
	    else if (keys === "D-7950") {
	        var totalSeconds = value;  // value가 초 단위라고 가정
	        var hours   = Math.floor(totalSeconds / 3600);
	        var minutes = Math.floor((totalSeconds % 3600) / 60);
	        var seconds = totalSeconds % 60;

	    
	        var mm = minutes < 10 ? "0" + minutes : minutes;
	        var ss = seconds < 10 ? "0" + seconds : seconds;

	
	        var timeString = hours + ": " + mm + ": " + ss + "";
	        $("." + keys).text(timeString);
	    }


		 // D-7950을 한글 시:분:초 형식으로 변환
		    else if (keys === "D-7952") {
		        var totalSeconds = value;  // value가 초 단위라고 가정
		        var hours   = Math.floor(totalSeconds / 3600);
		        var minutes = Math.floor((totalSeconds % 3600) / 60);
		        var seconds = totalSeconds % 60;

		    
		        var mm = minutes < 10 ? "0" + minutes : minutes;
		        var ss = seconds < 10 ? "0" + seconds : seconds;

		
		        var timeString = hours + ": " + mm + ": " + ss + "";
		        $("." + keys).text(timeString);
		    }
		    

	    	    
	    else if (keys === "D11013") {
	        $(".D11013").text(truncatedValue + " kN");
	    }
	    else if (keys === "D11105") {
	        $(".D11105").text((parseFloat(truncatedValue) / 10).toFixed(3).replace(/\.?0+$/, "") + " kN");
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
