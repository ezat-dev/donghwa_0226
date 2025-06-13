<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>History Trend</title>
    
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


		#pen-group{
			 margin-right: 10px;
            font-size: 17pt;
            padding: 10px;
            border-radius: 4px;
            width: 200px;
            background-color: #fff;
            border: 3px solid #ccc;
    
            height:54px;
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
.back-btn {
    background-color: #4CAF50; /* 초록색 배경 */
    color: white; /* 글자 색은 흰색 */
    font-size: 16px; /* 글자 크기 */
    padding: 10px 20px; /* 버튼 안쪽 여백 */
    border: none; /* 버튼 테두리 없애기 */
    border-radius: 5px; /* 둥근 모서리 */
    cursor: pointer; /* 마우스를 올리면 손 모양 커서 */
    transition: background-color 0.3s, transform 0.2s; /* 배경색 변화와 버튼 크기 변화 부드럽게 */
}

/* 버튼에 마우스를 올렸을 때 */
.back-btn:hover {
    background-color: #45a049; /* 배경색 조금 어두운 초록으로 변경 */
    transform: scale(1.05); /* 버튼 크기 살짝 키우기 */
}

/* 버튼 클릭했을 때 */
.back-btn:active {
    transform: scale(0.95); /* 클릭 시 버튼이 살짝 눌린 듯한 효과 */
}
    </style>
</head>
<body>
<div class="container2">
    <div class="button-container">
        <input type="text" id="startDate" class="datetimeSet ">
        <input type="text" id="endDate" class="datetimeSet">
                    <div class="pen-group-settings">
 
               <select id="pen-group"></select>
                 
         
            </div>
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
    	<div id="cursor1_StData" class="cursor1ToolData" style="top:140px;"></div>
    	
    	<div id="cursor1_TSData" class="cursor1ToolData" style="top:160px;"></div>
    	<div id="cursor1_OT3Data" class="cursor1ToolData" style="top:180px;"></div>

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
    		<div id="cursor2_StData" class="cursor2ToolData" style="top:140px;"></div>
    	
    	    	<div id="cursor1_TSData" class="cursor1ToolData" style="top:160px;"></div>
    	<div id="cursor1_OT3Data" class="cursor1ToolData" style="top:180px;"></div>
    </div>
</div>


<script>
var seriesArray = [];
var seriesData = [];
var trendInterval;



document.addEventListener("DOMContentLoaded", () => {
    const menu = document.getElementById('hamburgerMenu');


    // 0.3초 후에 메뉴를 닫기
    setTimeout(() => {
        menu.classList.remove('active');
    }, 300); // 300ms (0.3초) 후에 메뉴 닫기
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



function formatDate(date) {
    var d = new Date(date);
    var year = d.getFullYear();
    var month = ('0' + (d.getMonth() + 1)).slice(-2);
    var day = ('0' + d.getDate()).slice(-2);
    return year + '-' + month + '-' + day;
}

$(function() {
	
	trendDateSetting();
/*	
    var today = new Date();

    // 검색 시작일자
    var bYear = today.getFullYear();
    var bMonth = paddingZero(today.getMonth()+1);
    var bDate = paddingZero(today.getDate());
    var bHours = "00";
    var bMinutes = "00";

    // 검색 종료일자
    var aYear = today.getFullYear();
    var aMonth = paddingZero(today.getMonth()+1);
    var aDate = paddingZero(today.getDate());
    var aHours = paddingZero(today.getHours());
    var aMinutes = paddingZero(today.getMinutes());
    
    $("#startDate").val(bYear+"-"+bMonth+"-"+bDate+" "+bHours+":"+bMinutes);
    $("#endDate").val(aYear+"-"+aMonth+"-"+aDate+" "+aHours+":"+aMinutes);
*/

//	var selectedGroup = $("#pen-group").val();
    getPenGroupSelect();
    
    getPenGroupChartData();    
    setTimeout(function () {
//        $("#load-pen-group").click(); // 버튼 클릭 이벤트 트리거
    	getPenGroupChart();
    }, 500); // 0.5초 후 실행 

    // 첫 로드시 disabled(STOP 클릭시 활성화)
	buttonDisabled();
});


/*
document.addEventListener("DOMContentLoaded", () => {
    const menu = document.getElementById('hamburgerMenu');
   

    // 0.3초 후에 메뉴를 닫기
    setTimeout(() => {
        menu.classList.remove('active');
    }, 300); // 300ms (0.3초) 후에 메뉴 닫기
});
*/


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

	    //첫 로드시 disabled(STOP 클릭시 활성화)
	    buttonDisabled();

	    
	    var selectedGroup = $("#pen-group").val();
	
	    
	    setTimeout(function(){
	    	getPenGroupChart();
	    },1000);
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

		var onoverPR1 = $("#onoverPR1").text();
		var onoverPR2 = $("#onoverPR2").text();
		var onoverTS = $("#onoverTS").text();
		var onoverOT = $("#onoverOT").text();
		var onoverST = $("#onoverST").text();

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

		$("#cursor1_PR1Data").text(onoverPR1);
		$("#cursor1_PR2Data").text(onoverPR2);
		$("#cursor1_TSData").text(onoverTS);
		$("#cursor1_OTData").text(onoverOT);
		$("#cursor1_STData").text(onoverST);
	});
	
		$("#cursor2").on("click", function(){
		$("#cursor2Tooltip").show();
		
		
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


		var onoverPR1 = $("#onoverPR1").text();
		var onoverPR2 = $("#onoverPR2").text();
		var onoverTS = $("#onoverTS").text();
		var onoverOT = $("#onoverOT").text();
		var onoverST = $("#onoverST").text();
		

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

		$("#cursor1_PR1Data").text(onoverPR1);
		$("#cursor1_PR2Data").text(onoverPR2);
		$("#cursor1_TSData").text(onoverTS);
		$("#cursor1_OTData").text(onoverOT);
		$("#cursor1_STData").text(onoverST);
	});
	
//함수
//트렌드 날짜설정
function trendDateSetting() {
    var now = new Date(); // 현재 시간 = 종료일자 기준

    // 종료일자: 현재 시:분
    var aYear = now.getFullYear();
    var aMonth = paddingZero(now.getMonth() + 1);
    var aDate = paddingZero(now.getDate());
    var aHours = paddingZero(now.getHours());
    var aMinutes = paddingZero(now.getMinutes());

    // 시작일자: 종료일자 기준 4시간 전
    var start = new Date(now.getTime() - 1 * 60 * 60 * 1000);  // 4시간 = 4*60*60*1000ms

    var bYear = start.getFullYear();
    var bMonth = paddingZero(start.getMonth() + 1);
    var bDate = paddingZero(start.getDate());
    var bHours = paddingZero(start.getHours());
    var bMinutes = paddingZero(start.getMinutes());

    // input에 값 설정
    $("#startDate").val(bYear + "-" + bMonth + "-" + bDate + " " + bHours + ":" + bMinutes);
    $("#endDate").val(aYear + "-" + aMonth + "-" + aDate + " " + aHours + ":" + aMinutes);
}

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
	
    //트렌드 날짜설정
	trendDateSetting();	
	
	trendInterval = setInterval("getPenGroupChartDataInterval()",1000);	
	
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

	//그룹버튼
	$("#pen-group").removeAttr("disabled");
	
	//STOP버튼
	$("#stop-button").attr("disabled","true");
	$("#stop-button").css("background-color","#b0b0b0");
	
	clearInterval(trendInterval);
}


function getPenGroupSelect(){
    $.ajax({
        url: "/donghwa/analysis/historyTrendPenGroupSelect",
        method: "POST",
        data: {},
        dataType: "json",
        success: function(data) {
        	var result = data.result;
        	
        	var option = "";
        
        	var penName = "";
        	
        	for(var i=0; i<result.length; i++){
        		option = "<option value='"+result[i]+"'>"+result[i]+"</option>";
        		$("#pen-group").append(option);
        	}
        }
    });
}

function getPenGroupChartDataInterval(){
	trendDateSetting();
	getPenGroupChartData();
}

function getPenGroupChartData() {
    var sdate = $("#startDate").val() + ":00";
    var edate = $("#endDate").val() + ":59";
    var selectedGroup = $("#pen-group").val();

    // selectedGroup이 null인 경우 '그룹1'로 설정
    if (!selectedGroup) {
        selectedGroup = 'Group1';
    }

    $.ajax({
        url: "/donghwa/analysis/historyTrendPenGroupChart",
        type: "post",
        dataType: "json",
        data: {
            "sdateTime": sdate,
            "edateTime": edate,
            "pen_group_name": selectedGroup
        },
        success: function (result) {
            
        
            var data = result.data;
        //    console.log(" result.data:", data);

            var dataKeys = Object.keys(data);
            var dataValues = Object.values(data);
            
         //   console.log("=== 전체 데이터 키 ===", dataKeys);
         //   console.log("=== 전체 데이터 값 ===", dataValues);

            
            var groupConcatSplit = data.groupConcat.split(",");
          //  console.log("groupConcatSplit:", groupConcatSplit);
            var dataKeys = Object.keys(data);
            var dataValues = Object.values(data);

            

            var idx = 0;
            var idx2 = 0;

            for (var i = 0; i < dataKeys.length; i++) {
                for (var j = 0; j < groupConcatSplit.length; j++) {
                    if (dataKeys[i] == groupConcatSplit[j]) {
                        seriesArray[idx] = dataValues[i];
                        idx++;
                    }
                }
            }

            var chart = $("#container").highcharts();

            if (typeof chart != "undefined") {
                for (var i = 0; i < dataKeys.length; i++) {
                    for (var j = 0; j < groupConcatSplit.length; j++) {
                        if (dataKeys[i] == groupConcatSplit[j]) {
                            seriesArray[idx2] = dataValues[i];
                            idx2++;
                        }
                    }
                }
                chart.redraw();
            }
        }
    });
}

const categories = [
    '1e+8', '1e+6', '10000', '100', '1', '0.01', '0.001', '1e-8', '1e-10'
];
const formattedCategories = categories.map(item => parseFloat(item));

function getPenGroupChart(){
	console.log(seriesArray);
    const chart = Highcharts.chart('container', {
        chart: {
            type: "spline",
            panning: true,
            panKey: "shift",
            zoomType: "x",
            styleMode: true,
            height:720,  // 차트 높이 설정
            width: 1890   // 차트 너비 설정
        },
        
        time: {
            timezone: "Asia/Seoul",
            useUTC: false
        },
        yAxis: [
            {
                min:0,
                max:1500,
                crosshair: {
                    width: 3,
                    color: '#5D5D5D',
                    zIndex: 5
                },
                title: {
                    text: 'Temper(℃)'
                },
                labels: {
              /*   	format: '{value} (℃)', */
                    style: {
                        fontSize: "14pt"
                    }
                }
            },
            {
                min:0,
                max:12000,
                crosshair: {
                    width: 3,
                    color: '#5D5D5D',
                    zIndex: 5
                },
                title: {
                    text: 'Press[kN]'
                },
                labels: {
                	format: '{value} K' ,
                    style: {
                        fontSize: "14pt"
                    }
                }
            },
            {
            	type: 'logarithmic',
                min: 1e-6,
                max: 1e9,
                minorTickInterval: 0.1,
                title: {
                    text: 'Torr'
                },
                labels: {
                    formatter: function () {
                        return this.value.toExponential().replace('e', 'e');  // 예: 1e-6
                    },
                    style: {
                        fontSize: "12pt"
                    }
                }
            },
            {
            	min: 0,
            	max: 800,
                crosshair: {
                    width: 1,
                    color: '#5D5D5D',
                    zIndex: 5
                },
                title: {
                    text: 'Pressure'
                },
                labels: {
              /*   	format: '{value} (℃)', */
                    style: {
                        fontSize: "14pt"
                    }
                }
            }
            
            ],
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
                marker: {
                    radius: 1
                }
            }
        },
        series: seriesArray,
        responsive: {
            rules: [{
                condition: {
                    maxWidth: 1500
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
        tooltip: {
            useHTML: true,
            shared: true,
            backgroundColor: '#ffffff',
            borderColor: '#888',
            borderRadius: 8,
            borderWidth: 1,
            shadow: true,
            style: {
                fontSize: '13pt',
                color: '#000'
            },
            positioner: function (labelWidth, labelHeight, point) {
                // 차트 컨테이너 왼쪽 상단 기준 위치
                return { x: 20, y: 20 };
            },
            formatter: function () {
                $("#value0_v").text(Highcharts.dateFormat('%m-%d %H:%M:%S', this.x));
                var s = '<b style="font-size:14pt;">' + cursorSetDateTime(this.x) + '</b><br/>';

                const oneDecimalNames = [
                    "Current Load",
                    "force-sensor-1", "force-sensor-2", "force-sensor-3", "force-sensor-4",
                    "force-sensor-5", "force-sensor-6", "force-sensor-7", "force-sensor-8",
                    "force-sensor-9", "force-sensor-10", "force-sensor-11", "force-sensor-12",
                    "force sensor sum", "set-temp",
                ];

                this.points.forEach(function (point) {
                    var point_y = point.y;
                    var point_name = point.series.name;

                    if (point_name === 'Front Press' || point_name === 'Rear Press') {
                        point_y = point.y.toFixed(2);
                    } else if (point_name.indexOf("CP") !== -1) {
                        point_y = point.y.toFixed(3);
                    } else if (oneDecimalNames.includes(point_name)) {
                        point_y = point.y.toFixed(1);
                    }

                    $("#value" + (point.series.index + 1) + "_h").css("color", point.series.color);
                    $("#value" + (point.series.index + 1) + "_v").text(point_y);

                    s += '<span style="font-weight:bold; font-size:13pt; color:' + point.series.color + '">'
                        + point.series.name + ':</span> '
                        + '<span style="font-size:13pt;">' + point_y + '</span><br/>';
                });

                return s;
            }
        },


        exporting: {
            menuItemDefinitions: {
                label: {
                    onclick: function () {
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
    var date = new Date(t * 1000);
    var year = date.getFullYear();
    var month = paddingZero(date.getMonth() + 1);
    var day = paddingZero(date.getDate());
    var hour = paddingZero(date.getHours());
    var minute = paddingZero(date.getMinutes());
    var second = paddingZero(date.getSeconds()); // 👈 초 추가

    return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
}


</script>
</body>
</html>
