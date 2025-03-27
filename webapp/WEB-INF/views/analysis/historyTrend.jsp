<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>History Trend</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <%@ include file="../include/mainHeader.jsp" %>
   
    <jsp:include page="../include/pluginpage.jsp"/>
    <style>
        html, body {
            height: 95%;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .container2 {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100%;
          	width:100%; 
            padding: 20px;
            margin-top:60px;
            background-color: #f8f9fa;
        }

        .button-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
            margin-right:350px;
        }

  		 .datetimeSet {
            margin-right: 10px;
            font-size: 17pt;
            padding: 10px;
            border-radius: 4px;
            width: 250px;
            background-color: #fff;
            border: 3px solid #ccc;
            font-weight: bold;
            height:28px;
            text-align:center;
        }

        #load-pen-group, #stop-button, #start-button, #cursor1, #cursor2 {
            margin-left: 10px;
            padding: 10px 20px;
            font-size: 14pt;
            cursor: pointer;
            border: none;
            background-color: #3d3c3c;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s;
            height:52px;
        }

        #load-pen-group:hover, #stop-button:hover, #start-button:hover, #cursor1:hover, #cursor2:hover {
            background-color: #8e8e8e;
        }

        #container {
        	margin-top: 100px;
            width: 80%;
            height: 840px;
        }
        
        #pen-group-button {
		    margin-left: 10px;
		    padding: 10px 20px;
		    font-size: 14pt;
		    cursor: pointer;
		    border: none;
		    background-color: #3d3c3c;
		    color: white;
		    border-radius: 5px;
		    transition: background-color 0.3s;
		    height: 52px;
		}

		#pen-group-button:hover {
		    background-color: #8e8e8e;
		}

	.cursor1Tool{
		width:100px; 
		height:20px; 
		position:absolute; 
		left:20px;
		font-size:14pt;
	}

	.cursor1ToolData{
		width:160px; 
		height:20px; 
		position:absolute; 
		left:120px;
		font-size:14pt;
	}

	.cursor2Tool{
		width:100px; 
		height:20px; 
		position:absolute; 
		left:300px;
		font-size:14pt;
	}

	.cursor2ToolData{
		width:160px; 
		height:20px; 
		position:absolute; 
		left:400px;
		font-size:14pt;
	}

    </style>
</head>
<body>
<div class="container2">
    <div class="button-container">
        <input type="text" id="startDate" class="datetimeSet ">
        <input type="text" id="endDate" class="datetimeSet">
        <button id="load-pen-group"><i class="fas fa-refresh"></i> UPDATE</button>
        <button id="stop-button"><i class="fas fa-stop"></i> STOP</button>
        <button id="start-button"><i class="fas fa-play"></i> START</button>
        <button id="cursor1"><i class="fas fa-caret-left"></i> Cursor1</button>
        <button id="cursor2"><i class="fas fa-caret-right"></i> Cursor2</button>
        <button id="pen-group-button"><i class="fas fa-users"></i> 펜 그룹</button>
        
    </div>
    <div id="container"></div>
    
    
    
    <!-- 마우스를 올렸을 때의 값 -->
    <div id="onoverTooltip" style="display:none;">
    	<div id="onoverTime"></div>
    	<div id="onoverC1"></div>
    	<div id="onoverC2"></div>
    	<div id="onoverC3"></div>
    	<div id="onoverC4"></div>
    	<div id="onoverC5"></div>
    	<div id="onoverC6"></div>
    	<div id="onoverC7"></div>
    	<div id="onoverC8"></div>
    	<div id="onoverC9"></div>
    	<div id="onoverC10"></div>
    	<div id="onoverC11"></div>
    	<div id="onoverC12"></div>
    	<div id="onoverC13"></div>
    </div>    
    
    <!-- 커서1을 선택했을 때의 값 -->
    <div id="cursor1Tooltip" style="position:absolute; left:120px; top:160px; display:none;">
    	<div id="cursor1_time" class="cursor1Tool" style=" top:0px;">Cursor1</div>
    	<div id="cursor1_C1" class="cursor1Tool" style="top:20px;">TIC 4.1.1</div>
    	<div id="cursor1_C3" class="cursor1Tool" style="top:40px;">TIC 4.1.2</div>
    	<div id="cursor1_C5" class="cursor1Tool" style="top:60px;">TIC 4.3.1</div>
    	<div id="cursor1_C7" class="cursor1Tool" style="top:80px;">TIC 4.3.2</div>
    	<div id="cursor1_C9" class="cursor1Tool" style="top:100px;">TIC 4.5.1</div>
    	<div id="cursor1_C11" class="cursor1Tool" style="top:120px;">TIC 4.5.2</div>
    	<div id="cursor1_C13" class="cursor1Tool" style="top:140px;">TI 4.6.1</div>
    	
    	<div id="cursor1_timeData" class="cursor1ToolData" style=" top:0px;"></div>
    	<div id="cursor1_C1Data" class="cursor1ToolData" style="top:20px;"></div>
    	<div id="cursor1_C3Data" class="cursor1ToolData" style="top:40px;"></div>
    	<div id="cursor1_C5Data" class="cursor1ToolData" style="top:60px;"></div>
    	<div id="cursor1_C7Data" class="cursor1ToolData" style="top:80px;"></div>
    	<div id="cursor1_C9Data" class="cursor1ToolData" style="top:100px;"></div>
    	<div id="cursor1_C11Data" class="cursor1ToolData" style="top:120px;"></div>
    	<div id="cursor1_C13Data" class="cursor1ToolData" style="top:140px;"></div>
    </div>
    
    <!-- 커서2를 선택했을 때의 값 -->
    <div id="cursor2Tooltip" style="position:absolute; left:200px; top:160px; display:none;">
    	<div id="cursor2_time" class="cursor2Tool" style=" top:0px;">cursor2</div>
    	<div id="cursor2_C1" class="cursor2Tool" style="top:20px;">TIC 4.1.1</div>
    	<div id="cursor2_C3" class="cursor2Tool" style="top:40px;">TIC 4.1.2</div>
    	<div id="cursor2_C5" class="cursor2Tool" style="top:60px;">TIC 4.3.1</div>
    	<div id="cursor2_C7" class="cursor2Tool" style="top:80px;">TIC 4.3.2</div>
    	<div id="cursor2_C9" class="cursor2Tool" style="top:100px;">TIC 4.5.1</div>
    	<div id="cursor2_C11" class="cursor2Tool" style="top:120px;">TIC 4.5.2</div>
    	<div id="cursor2_C13" class="cursor2Tool" style="top:140px;">TI 4.6.1</div>
    	
    	<div id="cursor2_timeData" class="cursor2ToolData" style=" top:0px;"></div>
    	<div id="cursor2_C1Data" class="cursor2ToolData" style="top:20px;"></div>
    	<div id="cursor2_C3Data" class="cursor2ToolData" style="top:40px;"></div>
    	<div id="cursor2_C5Data" class="cursor2ToolData" style="top:60px;"></div>
    	<div id="cursor2_C7Data" class="cursor2ToolData" style="top:80px;"></div>
    	<div id="cursor2_C9Data" class="cursor2ToolData" style="top:100px;"></div>
    	<div id="cursor2_C11Data" class="cursor2ToolData" style="top:120px;"></div>
    	<div id="cursor2_C13Data" class="cursor2ToolData" style="top:140px;"></div>
    </div>
</div>


<script>
var seriesArray = [];
var seriesData = [];


document.addEventListener("DOMContentLoaded", () => {
    const menu = document.getElementById('hamburgerMenu');

    setTimeout(() => {
        menu.click();
    }, 1000); // 1초(1000ms) 후에 클릭
});

//SP값 포함
/*
var seriesNames = [
	 "c1", "c2", "c3", "c4", "c5", "c6", "c7", "c8",
	    "c9", "c10", "c11", "c12", "c13", "c14", "c15", "c16",
	    "c17", "c18", "c19", "c20", "c21", "c22",
	    "cs1", "cs2", "cs3", "cs4", "cs5", "cs6", "cs7", "cs8",
	    "cs9", "cs10", "cs11", "cs12", "cs13", "cs14", "cs15", "cs16"
];
*/
//SP값 미포함
var seriesNames = [
    "c1", "c3", "c5", "c7",
    "c9", "c11", "c13"
];

document.addEventListener("DOMContentLoaded", () => {
    const menu = document.getElementById('hamburgerMenu');
    menu.classList.add('active'); // 화면 로드 시 메뉴를 열어둠
});

function formatDate(date) {
    var d = new Date(date);
    var year = d.getFullYear();
    var month = ('0' + (d.getMonth() + 1)).slice(-2);
    var day = ('0' + d.getDate()).slice(-2);
    return year + '-' + month + '-' + day;
}

$(function(){
    var today = new Date();
    
    //검색 시작일자
    var bYear = today.getFullYear();
    var bMonth = paddingZero(today.getMonth()+1);
    var bDate = paddingZero(today.getDate());
    var bHours = "00";
    var bMinutes = "00";
    
    //검색 종료일자
    var aYear = today.getFullYear();
    var aMonth = paddingZero(today.getMonth()+1);
    var aDate = paddingZero(today.getDate());
    var aHours = paddingZero(today.getHours());
    var aMinutes = paddingZero(today.getMinutes());
    
    
    $("#startDate").val(bYear+"-"+bMonth+"-"+bDate+" "+bHours+":"+bMinutes);
    $("#endDate").val(aYear+"-"+aMonth+"-"+aDate+" "+aHours+":"+aMinutes);

    //첫 로드시 disabled(STOP 클릭시 활성화)
    buttonDisabled();

    
    var selectedGroup = 'asdasd';
    getPenGroupChartData();
    
    setTimeout(function(){
    	getPenGroupChart();
    },500);

});

//이벤트
    $("#pen-group-button").click(function() {
        window.location.href = "/donghwa/analysis/historyTrendPenGroup";
    });

	$("#load-pen-group").on("click", function(){
	    getPenGroupChartData();
	    
	    setTimeout(function(){
	    	getPenGroupChart();
	    },500);
	});
	

	//검색모드
	$("#stop-button").on("click",function(){
		buttonAbled();
	});

	
	
	
	//실시간모드(최종 적용시 인터벌 추가필요)
	$("#start-button").on("click",function(){
	    var today = new Date();
	    
	    //검색 시작일자
	    var bYear = today.getFullYear();
	    var bMonth = paddingZero(today.getMonth()+1);
	    var bDate = paddingZero(today.getDate());
	    var bHours = "00";
	    var bMinutes = "00";
	    
	    //검색 종료일자
	    var aYear = today.getFullYear();
	    var aMonth = paddingZero(today.getMonth()+1);
	    var aDate = paddingZero(today.getDate());
	    var aHours = paddingZero(today.getHours());
	    var aMinutes = paddingZero(today.getMinutes());
	    
	    
	    $("#startDate").val(bYear+"-"+bMonth+"-"+bDate+" "+bHours+":"+bMinutes);
	    $("#endDate").val(aYear+"-"+aMonth+"-"+aDate+" "+aHours+":"+aMinutes);

	    //첫 로드시 disabled(STOP 클릭시 활성화)
	    buttonDisabled();

	    
	    var selectedGroup = 'asdasd';
	    getPenGroupChartData();
	    
	    setTimeout(function(){
	    	getPenGroupChart();
	    },500);
	});
	
	$("#cursor1").on("click", function(){
		$("#cursor1Tooltip").show();
		
		var onoverTime = $("#onoverTime").text();
		var onoverC1 = $("#onoverC1").text();
		var onoverC2 = $("#onoverC2").text();
		var onoverC3 = $("#onoverC3").text();
		var onoverC4 = $("#onoverC4").text();
		var onoverC5 = $("#onoverC5").text();
		var onoverC6 = $("#onoverC6").text();
		var onoverC7 = $("#onoverC7").text();
		var onoverC8 = $("#onoverC8").text();
		var onoverC9 = $("#onoverC9").text();
		var onoverC10 = $("#onoverC10").text();
		var onoverC11 = $("#onoverC11").text();
		var onoverC12 = $("#onoverC12").text();
		var onoverC13 = $("#onoverC13").text();
		var onoverC14 = $("#onoverC14").text();
		var onoverC15 = $("#onoverC15").text();
		var onoverC16 = $("#onoverC16").text();
		var onoverC17 = $("#onoverC17").text();
		var onoverC18 = $("#onoverC18").text();
		var onoverC19 = $("#onoverC19").text();
		var onoverC20 = $("#onoverC20").text();
		var onoverC21 = $("#onoverC21").text();
		var onoverC22 = $("#onoverC22").text();
		var onoverCS1 = $("#onoverCS1").text();
		var onoverCS2 = $("#onoverCS2").text();
		var onoverCS3 = $("#onoverCS3").text();
		var onoverCS4 = $("#onoverCS4").text();
		var onoverCS5 = $("#onoverCS5").text();
		var onoverCS6 = $("#onoverCS6").text();
		var onoverCS7 = $("#onoverCS7").text();
		var onoverCS8 = $("#onoverCS8").text();
		var onoverCS9 = $("#onoverCS9").text();
		var onoverCS10 = $("#onoverCS10").text();
		var onoverCS11 = $("#onoverCS11").text();
		var onoverCS12 = $("#onoverCS12").text();
		var onoverCS13 = $("#onoverCS13").text();
		var onoverCS14 = $("#onoverCS14").text();
		var onoverCS15 = $("#onoverCS15").text();
		var onoverCS16 = $("#onoverCS16").text();

		$("#cursor1_timeData").text(onoverTime);
		$("#cursor1_C1Data").text(onoverC1);
		$("#cursor1_C2Data").text(onoverC2);
		$("#cursor1_C3Data").text(onoverC3);
		$("#cursor1_C4Data").text(onoverC4);
		$("#cursor1_C5Data").text(onoverC5);
		$("#cursor1_C6Data").text(onoverC6);
		$("#cursor1_C7Data").text(onoverC7);
		$("#cursor1_C8Data").text(onoverC8);
		$("#cursor1_C9Data").text(onoverC9);
		$("#cursor1_C10Data").text(onoverC10);
		$("#cursor1_C11Data").text(onoverC11);
		$("#cursor1_C12Data").text(onoverC12);
		$("#cursor1_C13Data").text(onoverC13);
		$("#cursor1_C14Data").text(onoverC14);
		$("#cursor1_C15Data").text(onoverC15);
		$("#cursor1_C16Data").text(onoverC16);
		$("#cursor1_C17Data").text(onoverC17);
		$("#cursor1_C18Data").text(onoverC18);
		$("#cursor1_C19Data").text(onoverC19);
		$("#cursor1_C20Data").text(onoverC20);
		$("#cursor1_C21Data").text(onoverC21);
		$("#cursor1_C22Data").text(onoverC22);
		$("#cursor1_CS1Data").text(onoverCS1);
		$("#cursor1_CS2Data").text(onoverCS2);
		$("#cursor1_CS3Data").text(onoverCS3);
		$("#cursor1_CS4Data").text(onoverCS4);
		$("#cursor1_CS5Data").text(onoverCS5);
		$("#cursor1_CS6Data").text(onoverCS6);
		$("#cursor1_CS7Data").text(onoverCS7);
		$("#cursor1_CS8Data").text(onoverCS8);
		$("#cursor1_CS9Data").text(onoverCS9);
		$("#cursor1_CS10Data").text(onoverCS10);
		$("#cursor1_CS11Data").text(onoverCS11);
		$("#cursor1_CS12Data").text(onoverCS12);
		$("#cursor1_CS13Data").text(onoverCS13);
		$("#cursor1_CS14Data").text(onoverCS14);
		$("#cursor1_CS15Data").text(onoverCS15);
		$("#cursor1_CS16Data").text(onoverCS16);

	});
	
	$("#cursor2").on("click", function(){
		$("#cursor2Tooltip").show();
		
		var onoverTime = $("#onoverTime").text();
		var onoverC1 = $("#onoverC1").text();
		var onoverC3 = $("#onoverC3").text();
		var onoverC5 = $("#onoverC5").text();
		var onoverC7 = $("#onoverC7").text();
		var onoverC9 = $("#onoverC9").text();
		var onoverC11 = $("#onoverC11").text();
		var onoverC13 = $("#onoverC13").text();

		$("#cursor2_timeData").text(onoverTime);
		$("#cursor2_C1Data").text(onoverC1);
		$("#cursor2_C3Data").text(onoverC3);
		$("#cursor2_C5Data").text(onoverC5);
		$("#cursor2_C7Data").text(onoverC7);
		$("#cursor2_C9Data").text(onoverC9);
		$("#cursor2_C11Data").text(onoverC11);
		$("#cursor2_C13Data").text(onoverC13);
	});
	
//함수
//첫 로드와 START버튼 눌렀을 때
function buttonDisabled(){
	//시작일	
	$("#startDate").attr("disabled","true");
	//종료일
	$("#endDate").attr("disabled","true");
	
	//검색버튼
	$("#load-pen-group").attr("disabled","true");
	$("#load-pen-group").css("background-color","#b0b0b0");
	
	//START버튼
	$("#start-button").attr("disabled","true");
	$("#start-button").css("background-color","#b0b0b0");
	
	//STOP버튼
	$("#stop-button").removeAttr("disabled");
	$("#stop-button").css("background-color","#3d3c3c");
	
}

//STOP버튼 눌렀을때
function buttonAbled(){
	//시작일	
	$("#startDate").removeAttr("disabled");
	//종료일
	$("#endDate").removeAttr("disabled");
	
	//검색버튼
	$("#load-pen-group").removeAttr("disabled");
	$("#load-pen-group").css("background-color","#3d3c3c");
	
	//START버튼
	$("#start-button").removeAttr("disabled");
	$("#start-button").css("background-color","#3d3c3c");
	
	//STOP버튼
	$("#stop-button").attr("disabled","true");
	$("#stop-button").css("background-color","#b0b0b0");	
}

function getPenGroupChartData() {
    var sdate = $("#startDate").val()+":00";
    var edate = $("#endDate").val()+":59";
    //동일한 쿼리를 사용하지만 asdasd가 아닐때만으로
    var selectedGroup = 'asdasd';

	
    $.ajax({
        url: "/donghwa/analysis/historyTrendPenGroupChart",
        type: "post",
        dataType: "json",
        data: {
            "pen_group_name": selectedGroup,
            "sdateTime": sdate,
            "edateTime": edate
        },
        success: function(result) {
            var data = result.data;
            // seriesNames 배열을 사용하여 각각의 데이터를 시리즈로 변환
            
            seriesData = [];
            
            seriesNames.forEach(function(name) {
                if (data[name]) {
                	
                	var changeName = "";
                	//펜 이름변경시 수정
                	
                	if(data[name].name == "c1"){
                	    changeName = "Zone 1.1";
                	}else if(data[name].name == "c2"){
                	    changeName = "Zone 1.2";
                	}else if(data[name].name == "c3"){
                	    changeName = "Zone 2.1";
                	}else if(data[name].name == "c4"){
                	    changeName = "Zone 2.2";
                	}else if(data[name].name == "c5"){
                	    changeName = "Zone 3.1";
                	}else if(data[name].name == "c6"){
                	    changeName = "Zone 3.2";
                	}else if(data[name].name == "c7"){
                	    changeName = "Protect 1";
                	}else if(data[name].name == "c8"){
                	    changeName = "Temp-load-1";
                	}else if(data[name].name == "c9"){
                	    changeName = "Temp-load-2";
                	}else if(data[name].name == "c10"){
                	    changeName = "Temp-load-3";
                	}else if(data[name].name == "c11"){
                	    changeName = "Temp-load-4";
                	}else if(data[name].name == "c12"){
                	    changeName = "Temp-load-5";
                	}else if(data[name].name == "c13"){
                	    changeName = "Temp-load-6";
                	}else if(data[name].name == "c14"){
                	    changeName = "Temp-load-7";
                	}else if(data[name].name == "c15"){
                	    changeName = "Temp-load-8";
                	}else if(data[name].name == "c16"){
                	    changeName = "Temp-load-9";
                	}else if(data[name].name == "c17"){
                	    changeName = "Temp-load-10";
                	}else if(data[name].name == "c18"){
                	    changeName = "Temp-load-11";
                	}else if(data[name].name == "c19"){
                	    changeName = "Temp-load-12";
                	}else if(data[name].name == "c20"){
                	    changeName = "Temp-Load-13";
                	}else if(data[name].name == "c21"){
                	    changeName = "Temp-Load-14";
                	}else if(data[name].name == "c22"){
                	    changeName = "Temp-Load-15";
                	}else if(data[name].name == "cs1"){
                	    changeName = "Current Load";
                	}else if(data[name].name == "cs2"){
                	    changeName = "Set Load";
                	}else if(data[name].name == "cs3"){
                	    changeName = "Front Press";
                	}else if(data[name].name == "cs4"){
                	    changeName = "Rear Press";
                	}else if(data[name].name == "cs5"){
                	    changeName = "force-sensor-1";
                	}else if(data[name].name == "cs6"){
                	    changeName = "force-sensor-2";
                	}else if(data[name].name == "cs7"){
                	    changeName = "force-sensor-3";
                	}else if(data[name].name == "cs8"){
                	    changeName = "force-sensor-4";
                	}else if(data[name].name == "cs9"){
                	    changeName = "force-sensor-5";
                	}else if(data[name].name == "cs10"){
                	    changeName = "force-sensor-6";
                	}else if(data[name].name == "cs11"){
                	    changeName = "force-sensor-7";
                	}else if(data[name].name == "cs12"){
                	    changeName = "force-sensor-8";
                	}else if(data[name].name == "cs13"){
                	    changeName = "force-sensor-9";
                	}else if(data[name].name == "cs14"){
                	    changeName = "force-sensor-10";
                	}else if(data[name].name == "cs15"){
                	    changeName = "force-sensor-11";
                	}else if(data[name].name == "cs16"){
                	    changeName = "force-sensor-12";
                	

            	}else if(data[name].name == "pr1"){
            	    changeName = "furnace-vacuum";
            	}
	        	}else if(data[name].name == "pr2"){
	        	    changeName = "diffusion-pump";
        		}
                	var endSetDate;
                    var series = {
                        name: changeName,
                        color: data[name].color,
//                        yAxis: data[name].yAxis,
                        data: data[name].data.map(function(item, index) {
                            var date = new Date(data.tdate[index]);
//                            var offset = 9 * 60 * 60 * 1000; // 타임존 보정 (UTC+9)
                            var localDate = new Date(date.getTime());
                            endSetDate = data.tdate[index];
                            return [localDate.getTime(), item[1]]; // [timestamp, value]
                        })
                    };
                    
                    $("#onoverTime").text(cursorSetDateTime(endSetDate));
                    
                    if(series.name == "TIC 4.1.1"){
                    	$("#onoverC1").css("color",series.color);
                    	$("#onoverC1").text(series.data[series.data.length-1][1]);
                    }else if(series.name == "TIC 4.1.2"){            	
                    	$("#onoverC3").css("color",series.color);
                    	$("#onoverC3").text(series.data[series.data.length-1][1]);
                    }else if(series.name == "TIC 4.3.1"){            	
                    	$("#onoverC5").css("color",series.color);
                    	$("#onoverC5").text(series.data[series.data.length-1][1]);
                    }else if(series.name == "TIC 4.3.2"){            	
                    	$("#onoverC7").css("color",series.color);
                    	$("#onoverC7").text(series.data[series.data.length-1][1]);
                    }else if(series.name == "TIC 4.5.1"){            	
                    	$("#onoverC9").css("color",series.color);
                    	$("#onoverC9").text(series.data[series.data.length-1][1]);
                    }else if(series.name == "TIC 4.5.2"){            	
                    	$("#onoverC11").css("color",series.color);
                    	$("#onoverC11").text(series.data[series.data.length-1][1]);
                    }else if(series.name == "TIC 4.6.1"){            	
                    	$("#onoverC13").css("color",series.color);
                    	$("#onoverC13").text(series.data[series.data.length-1][1]);
                    }
                    
                    seriesData.push(series);
                }
            });
            
			var chart = $("#container").highcharts();
			
			if(typeof chart != "undefined"){	
				chart.redraw();
			}              
        }
    });
}

function getPenGroupChart() {
   const chart = Highcharts.chart('container', {
	   title:{
		   text:"Batch",
		   align:"center"
	   },
        chart: {
            type: "spline",
            panning: true,
            panKey: "shift",
            zoomType: "x",
            styleMode: true
        },
        time: {
            timezone: "Asia/Seoul",
            useUTC: false
        },
        yAxis: [{
            crosshair: {
                width: 3,
                color: '#5D5D5D',
                zIndex: 5
            },
            title: {
                text: 'Temper(℃)'
            },
            labels: {
                style: {
                    fontSize: "14pt"
                }
            },
            min:0,
            max:1800
        }],
        xAxis: {
            crosshair: {
                width: 3,
                color: '#5D5D5D',
                zIndex: 5
            },
            labels: {
                formatter: function() {
                    return unix_timestamp(this.value);
                },
                style: {
                    fontSize: "11pt"
                }
            },
            allowDecimals: false
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle'
        },
        plotOptions: {
            series: {
                selected: true,
                allowPointSelect: true,
                marker: {
                    radius: 1
                },
                events:{
                	click: function(event){
                		var pointIndex = event.point.index;
/*                		
                		console.log(event);
                		console.log(pointIndex);
                		console.log(seriesData[0].data[pointIndex][1]);
*/               		
                		var time = seriesData[0].data[pointIndex][0];
                		var c1 = seriesData[0].data[pointIndex][1];
                		var c3 = seriesData[1].data[pointIndex][1];
                		var c5 = seriesData[2].data[pointIndex][1];
                		var c7 = seriesData[3].data[pointIndex][1];
                		var c9 = seriesData[4].data[pointIndex][1];
                		var c11 = seriesData[5].data[pointIndex][1];
                		var c13 = seriesData[6].data[pointIndex][1];
                		
                		$("#onoverTime").text(cursorSetDateTime(time));
                		$("#onoverC1").text(c1);
                		$("#onoverC3").text(c3);
                		$("#onoverC5").text(c5);
                		$("#onoverC7").text(c7);
                		$("#onoverC9").text(c9);
                		$("#onoverC11").text(c11);
                		$("#onoverC13").text(c13);
                		
                	}
                }
            }
        },
        tooltip: {
            useHTML: true,
            shared: true, // 여러 시리즈의 데이터를 보여줌
            positioner: function(labelWidth, labelHeight, point) {
              return { x: point.plotX + this.chart.plotLeft + 15, y: point.plotY + this.chart.plotTop - labelHeight }; // 툴팁 위치 조정
            },
            formatter: function() {
//          	  $("#value0_v").text(unix_timestamp(this.x));
              var s = '<b>' + cursorSetDateTime(this.x) + '</b><br/>'; // 시간 표시
              this.points.forEach(function(point) {
              	var point_y = point.y;
              	var point_name = point.series.name;
              	if(point_name.indexOf("CP") != -1){
              		point_y = (point.y).toFixed(3);
              	}
              	
//              	$("#value"+(point.series.index+1)+"_h").css("color",point.series.color);
//              	$("#value"+(point.series.index+1)+"_v").text(point_y);
                s += '<span style="font-weight:bold; font-size:10pt;">' + point.series.name + ':</span> ' + point_y + '<br/>'; // 각 시리즈의 데이터 표시
              });
              return s;
            },
            borderColor: '#333333',
            shadow: false
          },
        series: seriesData,
        responsive: {
            rules: [{
                condition: {
/*                    maxWidth: 1200*/
                },
                chartOptions: {
                    legend: {
                        layout: 'horizontal',
                        align: 'center',
                        verticalAlign: 'bottom'
                    }
                }
            }]
        },
        exporting: {
            menuItemDefinitions: {
                label: {
                    onclick: function() {
                        this.renderer.label(
                            'You just clicked a custom menu item',
                            100,
                            100
                        )
                            .attr({
                                fill: '#a4edba',
                                r: 5,
                                padding: 10,
                                zIndex: 10
                            })
                            .css({
                                fontSize: '1.5em'
                            })
                            .add();
                    },
                    text: 'Show label'
                }
            },
            buttons: {
                contextButton: {
                    menuItems: ['downloadPNG', 'downloadPDF', 'downloadXLS', 'separator']
                }
            }
        },
        legend: {
            itemStyle: {
                fontSize: "11pt"
            }
        }
    });
}


function unix_timestamp(t) {
//	console.log(t);	

    var date = new Date(t*1000);
    var year = date.getFullYear();

    var month = paddingZero(date.getMonth()+1);
    var day = paddingZero(date.getDate());
    var hour = paddingZero(date.getHours());
    var minute = paddingZero(date.getMinutes());
    
    return month.substr(-2) + "-" + day.substr(-2) + "<br/> " + hour.substr(-2) + ":" + minute.substr(-2);
}

function cursorSetDateTime(t) {
//	console.log(t);	

    var date = new Date(t*1000);
    var year = date.getFullYear();

    var month = paddingZero(date.getMonth()+1);
    var day = paddingZero(date.getDate());
    var hour = paddingZero(date.getHours());
    var minute = paddingZero(date.getMinutes());
    
    return year+"-"+month.substr(-2) + "-" + day.substr(-2) + " " + hour.substr(-2) + ":" + minute.substr(-2);
}

</script>
</body>
</html>
