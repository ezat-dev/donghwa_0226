<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- jQuery -->
<script type="text/javascript" src="/donghwa/js/jquery-3.7.1.min.js"></script>

<!-- Tabulator -->
<script type="text/javascript" src="/donghwa/js/tabulator/tabulator.js"></script>
<link rel="stylesheet" href="/donghwa/css/tabulator/tabulator_simple.css">

<!-- HighChart -->
<script type="text/javascript" src="/donghwa/js/highchart/highcharts.js"></script>
<script type="text/javascript" src="/donghwa/js/highchart/exporting.js"></script>
<script type="text/javascript" src="/donghwa/js/highchart/export-data.js"></script>
<!--  
<script type="text/javascript" src="/donghwa/js/highchart/data.js"></script>
-->

<!-- Air Datepicker -->
<script type="text/javascript" src="/donghwa/js/airdatepicker/datepicker.min.js"></script>
<script type="text/javascript" src="/donghwa/js/airdatepicker/datepicker.ko.js"></script>
<link rel="stylesheet" href="/donghwa/css/airdatepicker/datepicker.min.css"/>
<link rel="stylesheet" href="/donghwa/css/select2/select2.css"/>


<script type="text/javascript" src="/donghwa/js/select2/select2.min.js"></script>

<style>
	

.anlog-popup-div-color{
	background-color:lightblue;
}

.digital-popup-div-color{
	background-color:lightblue !important;
}

	
	
</style>
<body>


	<input type="text" id="sendGroup" style="display: none;"/>
	<input type="text" id="sendTag" style="display: none;"/>
	<input type="text" id="sendVal" style="display: none;"/>
	
<script>

$(function(){
	$(".datetimeSet").datepicker({
	    language: 'ko',
	    autoClose: true,
	    timepicker: true,         // 시간 선택 활성화
	    dateFormat: 'yyyy-MM-dd', // 날짜 형식
	    timeFormat: 'hh:ii AA',      // 시간과 분 형식
	    step: 1,                  // 분 단위 조정(예: 5분 단위)
		onSelect: function (formattedDate, date, picker) {

			var selectId = picker.$el[0].id;
			var selectDate = new Date(date);
			
		    var sYear = selectDate.getFullYear();
		    var sMonth = paddingZero(selectDate.getMonth()+1);
		    var sDate = paddingZero(selectDate.getDate());
		    var sHours = paddingZero(selectDate.getHours());
		    var sMinutes = paddingZero(selectDate.getMinutes());
		    
		    $("#"+selectId).val(sYear+"-"+sMonth+"-"+sDate+" "+sHours+":"+sMinutes);
		}	
	});
	
	
	
/*
    dateFormat: 'yyyy-MM-dd',
    timeFormat: 'hh:ii',  
*/	
	$(".datetimeSet2").datepicker({
	    language: 'ko',
	    autoClose: true,
	    timepicker: true,         // 시간 선택 활성화
	    dateFormat: 'yyyy-MM-dd', // 날짜 형식
	    timeFormat: 'HH:ii',      // 시간과 분 형식
	    step: 1,                  // 분 단위 조정(예: 5분 단위)
	});
});


function paddingZero(value){
	var returnValue = "";
	if(value < 10){
		returnValue = "0"+value;
	}else{
		returnValue = ""+value;
	}
	
	return returnValue;
}

//아날로그값 쓰기
function popupOpenAna(keys, value){
	//keys : 클래스
	//tagDir : 오토닉스 그룹경로

	
	$("."+keys).addClass("anlog-popup-div-color");
	$("."+keys).attr("contenteditable","true");
	$("."+keys).focus();
	$("."+keys).text("");
	
	$("#sendGroup").val(value);
	$("#sendTag").val(keys);
	
	   console.log("📌 s123123endGroup:", sendGroup);
	    console.log("📌 se123123ndTag:", sendTag);
//	modalOpen();
}


$("*").on("keydown",function(e){
//	console.log(e);
	
	//엔터키가 눌렸을 때
	if(e.keyCode == 13){
		var className = e.target.className;
		
		if(className.indexOf("anlog-popup-div-color") != -1){
//			console.log("선택 엔터키");
//			console.log(e);
//			console.log(e.target.className);
//			$("."+splitClassName[0]).focusOut();
			
//			console.log(e.target.innerHTML);

			var splitClassName = e.target.className.split(" ");
//			console.log(splitClassName[0]);
			
			$("#sendVal").val($("."+splitClassName[0]).text());				
			
			$("."+splitClassName[0]).removeClass("anlog-popup-div-color");
			$("."+splitClassName[0]).blur();			
			
		
			analogDataSave();
		}
	}else if(e.keyCode == 27){
		//ESC
		var className = e.target.className;
		
		if(className.indexOf("anlog-popup-div-color") != -1){
			var splitClassName = e.target.className.split(" ");
//			console.log("ESC");
//			console.log(splitClassName[0]);
			$("."+splitClassName[0]).removeClass("anlog-popup-div-color");
			$("."+splitClassName[0]).blur();
		}
	}
});

function analogDataSave() {
    var sendGroup = $("#sendGroup").val();
    var sendTag = $("#sendTag").val();
    var sendVal = $("#sendVal").val();


    console.log("🔹 입력된 값 확인");
    console.log("📌 sendGroup:", sendGroup);
    console.log("📌 sendTag:", sendTag);
    console.log("📌 sendVal:", sendVal);

    
    if (sendVal.length <= 0) {
        alert("값을 입력하십시오!");
        modalClose();
        return false;
    }

    const numRegex = /^-?[0-9]*\.?[0-9]+$/;
    
    if (!numRegex.test(sendVal)) {
        alert("숫자만 입력하십시오!");
        return false;
    }
    var convertedValue = 0;
    var apiUrl;
    

    // sendVal이 소수점이 포함된 값이면 float, 아니면 analog (정수)
    var isFloat = sendVal.includes(".");
    apiUrl = isFloat 
        ? "/donghwa/common/valueFloatSet"  // 소수점이 있으면 float 처리
        : "/donghwa/common/valueAnalogSet"; // 정수이면 analog 처리

        console.log("📢 API 호출:", apiUrl);
        console.log("🔍 데이터 타입:", isFloat ? "실수 (Float)" : "정수 (Integer)");
        console.log("💾 전송값:", sendVal, "(Type:", typeof convertedValue, ")");
	console.log(typeof sendVal);
    // 숫자로 변환 (float 또는 short)
    var convertedValue = isFloat ? sendVal : parseInt(sendVal);


	
    $.ajax({
        url: apiUrl,
        type: "post",
        dataType: "json",
        data: {
            "sendTagDir": sendGroup,
            "sendTagName": sendTag,
            "sendTagValue": convertedValue
        },
        success: function(result) {
            console.log(result); 
//          modalClose();
        }
    });
}


$("*").on("click",function(e){
/*
	var className = e.target.className;
	
	if(className.indexOf("anlog-popup-div-color") != -1){
		var splitClassName = e.target.className.split(" ");
//		console.log("ESC");
//		console.log(splitClassName[0]);
		$("."+splitClassName[0]).removeClass("anlog-popup-div-color");
		$("."+splitClassName[0]).blur();
	}
*/
	$("*").removeClass("anlog-popup-div-color");
	
});


$(document).ready(function(){
	$("*").bind("selectstart", function(e){
		return false;
	});	
});

$("*").on("mouseup", function(e){

	if($("*").hasClass("digital-popup-div-color")){
		console.log("마우스 뗌 데이터 있음");

		
		clearInterval(btnInterval);
		
		$("*").removeClass("digital-popup-div-color");
		
		clickTime = 0;
		$("#circle").css("display","none");		
	}
});

</script>
</body>
</html>