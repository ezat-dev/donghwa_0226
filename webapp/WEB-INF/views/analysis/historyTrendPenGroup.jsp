<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
    height: 100%;
    margin: 0;
    font-family: Arial, sans-serif;
}
.container {
    display: flex;
    align-items: center; /* 수직 정가운데 정렬 */
    justify-content: center; /* 수평 정가운데 정렬 (필요하면 추가) */
	    height: 1110px;
    padding: 30px;
    margin-bottom:20px;
}

#pen-name{
    width: 590px;
}


.left {


    background-color: #f8f9fa;

    box-sizing: border-box;
    display: flex;
    align-items: center;
  
}

.left h2 {
    margin-top: 0;
    margin-bottom: 20px;
    color: #333;
    font-size: 18px;
}

.pen-settings {
    display: flex;
    flex-direction: column;
    width: 100%;
    
    
	margin-top: 60px;
}

.pen-settings label {
    margin-bottom: 5px;
    font-weight: bold;
    color: #555;
}

.pen-settings input[type="text"],
.pen-settings select,
.pen-settings input[type="color"],
.pen-settings button {
    margin-bottom: 15px;
    padding: 8px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.pen-settings select {
    height: 560px;
}

.pen-settings input[type="color"],
.pen-settings button {

    height: 40px;
    margin-left: 5px;
}

.pen-settings button {
    background-color: white;
    color: black;
    border: 1px solid black;
    cursor: pointer;
    transition: background-color 0.3s;
}

.pen-settings button:hover {
    background-color: #f0f0f0;
}

.right {
    flex: 8;
    background-color: #f8f9fa;
    /* padding: 10px; */
    position: relative;
    display: flex;
    align-items: center;
    /* height: 80%; */
    margin-top: 0px;
}

#container {
    width: 90%;
        
    margin: 0 auto;
}

.pen-group-settings {
    display: flex;
    align-items: center;
    height: 80px;
    gap: 10px;
}

.pen-group-settings label {
    margin: 0;
    font-weight: bold;
}

.pen-group-settings select {
    margin: 0;
    height: 36px;
    width: 150px;
}

.btn-container {
    display: flex;
    gap: 10px;
    height: 40px;
    width: 340px;
    margin-left: 5px;
}

.pen-group-settings button {
    font-size: 12px;
    font-weight: bold;
}

#pen-list, #pen-search {
    width: 610px;
}

#pen-list {
    font-size: 15px;
}
.delete-pen-group{
background-color: #d5d3d3;
cursor: "";
}
.line{
  
    border: 1px solid #ccc; /* 연한 회색 테두리 */
    padding: 10px; /* 내부 여백 */
    border-radius: 5px; /* 모서리를 살짝 둥글게 */
    margin-left: 30px;
}

</style>
</head>
<body style="background-color: #f8f9fa;">
<div class="container">
   
   
   
    <div class="left">
    <div class="line">
        <div class="pen-settings">
 

            <div class="pen-group-settings">
                <label for="pen-group">Pen Group:</label>
                <select id="pen-group"></select>
                <div class="btn-container">
                    <button id="load-pen-group"><i class="fas fa-save"></i> LOAD PEN GROUP</button>
                    <button id="delete-pen-group"><i class="fas fa-trash"></i> DELETE PEN GROUP</button>
                </div>
            </div>
            <h2>Pen Groups Settings</h2>
<!--             <label for="pen-search">Search Pen:</label>
            <input type="text" id="pen-search" placeholder="Search Pen..."> -->
            <label for="pen-list">Pen List:</label>
            <select id="pen-list" multiple></select>
           
           
           
        <!--     <label for="pen-color">Color:</label>
            <input type="color" id="pen-color" value="#ff0000"> -->
         
			     
		<!-- 	<label for="pen-name">Pen Name:</label>
			<input type="text" id="pen-name" placeholder="Enter Pen Name..."> -->
		

            <button type="button" id="add-button">Add</button>
            <button type="button" id="del-button">Delete</button>
             <button id="backButton">Back</button>
        </div>
    </div>
    </div>>
    
    
    
    <div class="right">
        <div id="container"></div>
    </div>
</div>


    <script>
//전역변수
var seriesArray = [];
    
document.addEventListener("DOMContentLoaded", () => {
    const menu = document.getElementById('hamburgerMenu');
   

    // 0.3초 후에 메뉴를 닫기
    setTimeout(() => {
        menu.classList.remove('active');
    }, 300); // 300ms (0.3초) 후에 메뉴 닫기
});

// 로드 시
$(document).ready(function() {
    getPenGroupSelect();

    setTimeout(function () {
        $("#load-pen-group").click(); // 버튼 클릭 이벤트 트리거
    }, 500); // 0.5초 후 실행
});




//이벤트

//로드 펜 그룹 클릭
$("#load-pen-group").on("click", function(){
    getPenGroupList();        // 펜 리스트를 새로 가져옴
    getPenGroupChartData();   // 차트 데이터를 새로 가져옴
    setTimeout(function(){
        getPenGroupChart();
    }, 500);               
});

document.getElementById('backButton').addEventListener('click', function() {
    window.history.back();
});

$("#pen-list").on("change", function(e) {
    var penName = $(this).val(); // 선택된 옵션 값 가져오기

    var penMapping = {
        "c1": "Zone 1.1",
        "c2": "Zone 1.2",
        "c3": "Zone 2.1",
        "c4": "Zone 2.2",
        "c5": "Zone 3.1",
        "c6": "Zone 3.2",
        "c7": "Protect 1",
        "c8": "Temp-load-1",
        "c9": "Temp-load-2",
        "c10": "Temp-load-3",
        "c11": "Temp-load-4",
        "c12": "Temp-load-5",
        "c13": "Temp-load-6",
        "c14": "Temp-load-7",
        "c15": "Temp-load-8",
        "c16": "Temp-load-9",
        "c17": "Temp-load-10",
        "c18": "Temp-load-11",
        "c19": "Temp-load-12",
        "c20": "Temp-Load-13",
        "c21": "Temp-Load-14",
        "c22": "Temp-Load-15",
        
        // cs1~cs16 추가
        "cs1": "Current Load",
        "cs2": "Set Load",
        "cs3": "Front Press",
        "cs4": "Rear Press",
        "cs5": "force-sensor-1",
        "cs6": "force-sensor-2",
        "cs7": "force-sensor-3",
        "cs8": "force-sensor-4",
        "cs9": "force-sensor-5",
        "cs10": "force-sensor-6",
        "cs11": "force-sensor-7",
        "cs12": "force-sensor-8",
        "cs13": "force-sensor-9",
        "cs14": "force-sensor-10",
        "cs15": "force-sensor-11",
        "cs16": "force-sensor-12",

            "pr1": "furnace-vacuum",
            "pr2": "diffusion-pump"
    };

    // 매핑된 값이 있으면 사용, 없으면 그대로 유지
    penName = penMapping[penName] || penName;

    $("#pen-name").val(penName); // 입력 필드에 값 설정
});


$("#add-button").on("click", function() {
    var penGroup = $("#pen-group").val(); // 선택한 Pen 그룹
 /*    var penColor = $("#pen-color").val(); // Pen 색상 */
    var penName = selectedPenName
/*
    if(penName == "Zone 1.1"){
        penName = "c1";
    }else if(penName == "Zone 1.2"){
        penName = "c2";
    }else if(penName == "Zone 2.1"){
        penName = "c3";
    }else if(penName == "Zone 2.2"){
        penName = "c4";
    }else if(penName == "Zone 3.1"){
        penName = "c5";
    }else if(penName == "Zone 3.2"){
        penName = "c6";
    }else if(penName == "Protect 1"){
        penName = "c7";
    }else if(penName == "Temp-load-1"){
        penName = "c8";
    }else if(penName == "Temp-load-2"){
        penName = "c9";
    }else if(penName == "Temp-load-3"){
        penName = "c10";
    }else if(penName == "Temp-load-4"){
        penName = "c11";
    }else if(penName == "Temp-load-5"){
        penName = "c12";
    }else if(penName == "Temp-load-6"){
        penName = "c13";
    }else if(penName == "Temp-load-7"){
        penName = "c14";
    }else if(penName == "Temp-load-8"){
        penName = "c15";
    }else if(penName == "Temp-load-9"){
        penName = "c16";
    }else if(penName == "Temp-load-10"){
        penName = "c17";
    }else if(penName == "Temp-load-11"){
        penName = "c18";
    }else if(penName == "Temp-load-12"){
        penName = "c19";
    }else if(penName == "Temp-Load-13"){
        penName = "c20";
    }else if(penName == "Temp-Load-14"){
        penName = "c21";
    }else if(penName == "Temp-Load-15"){
        penName = "c22";
    }else if(penName == "Current Load"){
        penName = "cs1";
    }else if(penName == "Set Load"){
        penName = "cs2";
    }else if(penName == "Front Press"){
        penName = "cs3";
    }else if(penName == "Rear Press"){
        penName = "cs4";
    }else if(penName == "force-sensor-1"){
        penName = "cs5";
    }else if(penName == "force-sensor-2"){
        penName = "cs6";
    }else if(penName == "force-sensor-3"){
        penName = "cs7";
    }else if(penName == "force-sensor-4"){
        penName = "cs8";
    }else if(penName == "force-sensor-5"){
        penName = "cs9";
    }else if(penName == "force-sensor-6"){
        penName = "cs10";
    }else if(penName == "force-sensor-7"){
        penName = "cs11";
    }else if(penName == "force-sensor-8"){
        penName = "cs12";
    }else if(penName == "force-sensor-9"){
        penName = "cs13";
    }else if(penName == "force-sensor-10"){
        penName = "cs14";
    }else if(penName == "force-sensor-11"){
        penName = "cs15";
    }else if(penName == "force-sensor-12"){
        penName = "cs16";
	}else if(penName == "furnace-vacuum"){
	    penName = "pr1";
	}else if(penName == "diffusion-pump"){
	    penName = "pr2";
	}
*/
    // 필수 값 확인
    if (!penGroup || !penName) {
        alert("Pen 그룹과 이름을 모두 입력해주세요.");
        return;
    }

    // 데이터 전송
    console.log("보내는 값:", {
        penGroup: penGroup,
      
        penName: selectedPenName
    });

    $.ajax({
        url: "/donghwa/analysis/penGroupPenAdd", // 서버 엔드포인트
        type: "POST",
        dataType: "json",
        data: {
            "penGroup": penGroup,
            "penColor": "",
            "penName": selectedPenName
        },
        success: function (response) {
            if (response.success) {
                alert("Pen 데이터가 성공적으로 추가 되었습니다.");
                
              
                getPenGroupList();       // Pen 그룹 목록 새로고침
                getPenGroupChartData();  // 그래프 데이터 갱신
                setTimeout(getPenGroupChart, 500); // 그래프 다시 그리기
            } else {
                alert("Pen 데이터를 추가 하는 데 실패했습니다.");
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("Error:", jqXHR, textStatus, errorThrown);
            alert("서버 요청 중 오류가 발생했습니다.");
        }
    });
});


var selectedPenName = ""; 

$("#pen-list").on("change", function () {
    var selectedValues = $(this).val(); // 선택된 값 (배열일 가능성 있음)
    
    if (Array.isArray(selectedValues) && selectedValues.length > 0) {
        selectedPenName = selectedValues[0]; // 첫 번째 선택된 값만 가져오기
    } else {
        selectedPenName = selectedValues; // 단일 값이면 그대로 저장
    }
    
    console.log("선택한 Pen Name:", selectedPenName);
});


	


$("#del-button").on("click", function() {
    var penGroup = $("#pen-group").val(); // 선택한 Pen 그룹
   
    var penName = selectedPenName; // 입력한 Pen 이름

    console.log("삭제 Pen Group:", penGroup);
    console.log("삭제 Pen Name:", penName);
    
/*
    if(penName == "Zone 1.1"){
        penName = "c1";
    }else if(penName == "Zone 1.2"){
        penName = "c2";
    }else if(penName == "Zone 2.1"){
        penName = "c3";
    }else if(penName == "Zone 2.2"){
        penName = "c4";
    }else if(penName == "Zone 3.1"){
        penName = "c5";
    }else if(penName == "Zone 3.2"){
        penName = "c6";
    }else if(penName == "Protect 1"){
        penName = "c7";
    }else if(penName == "Temp-load-1"){
        penName = "c8";
    }else if(penName == "Temp-load-2"){
        penName = "c9";
    }else if(penName == "Temp-load-3"){
        penName = "c10";
    }else if(penName == "Temp-load-4"){
        penName = "c11";
    }else if(penName == "Temp-load-5"){
        penName = "c12";
    }else if(penName == "Temp-load-6"){
        penName = "c13";
    }else if(penName == "Temp-load-7"){
        penName = "c14";
    }else if(penName == "Temp-load-8"){
        penName = "c15";
    }else if(penName == "Temp-load-9"){
        penName = "c16";
    }else if(penName == "Temp-load-10"){
        penName = "c17";
    }else if(penName == "Temp-load-11"){
        penName = "c18";
    }else if(penName == "Temp-load-12"){
        penName = "c19";
    }else if(penName == "Temp-Load-13"){
        penName = "c20";
    }else if(penName == "Temp-Load-14"){
        penName = "c21";
    }else if(penName == "Temp-Load-15"){
        penName = "c22";
    }else if(penName == "Current Load"){
        penName = "cs1";
    }else if(penName == "Set Load"){
        penName = "cs2";
    }else if(penName == "Front Press"){
        penName = "cs3";
    }else if(penName == "Rear Press"){
        penName = "cs4";
    }else if(penName == "force-sensor-1"){
        penName = "cs5";
    }else if(penName == "force-sensor-2"){
        penName = "cs6";
    }else if(penName == "force-sensor-3"){
        penName = "cs7";
    }else if(penName == "force-sensor-4"){
        penName = "cs8";
    }else if(penName == "force-sensor-5"){
        penName = "cs9";
    }else if(penName == "force-sensor-6"){
        penName = "cs10";
    }else if(penName == "force-sensor-7"){
        penName = "cs11";
    }else if(penName == "force-sensor-8"){
        penName = "cs12";
    }else if(penName == "force-sensor-9"){
        penName = "cs13";
    }else if(penName == "force-sensor-10"){
        penName = "cs14";
    }else if(penName == "force-sensor-11"){
        penName = "cs15";
    }else if(penName == "force-sensor-12"){
        penName = "cs16";
    
	}else if(penName == "furnace-vacuum"){
	    penName = "pr1";
	
	}else if(penName == "diffusion-pump"){
	    penName = "pr2";
	}
*/
    // 필수 값 확인
    if (!penGroup || !penName) {
        alert("Pen 그룹과 이름을 모두 입력해주세요.");
        return;
    }

    // 데이터 전송
    console.log("지우는 값 보내는 값:", {
        penGroup: penGroup,
      
        penName: penName
    });

    $.ajax({
        url: "/donghwa/analysis/penGroupPenDelete", // 서버 엔드포인트
        type: "POST",
        dataType: "json",
        data: {
            "penGroup": penGroup,
         
            "penName": penName
        },
        success: function (response) {
            if (response.success) {
                alert("Pen 데이터가 성공적으로 삭제되었습니다.");
                
              
                getPenGroupList();       // Pen 그룹 목록 새로고침
                getPenGroupChartData();  // 그래프 데이터 갱신
                setTimeout(getPenGroupChart, 700); // 그래프 다시 그리기
            } else {
                alert("Pen 데이터를 삭제하는 데 실패했습니다.");
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error("Error:", jqXHR, textStatus, errorThrown);
            alert("서버 요청 중 오류가 발생했습니다.");
        }
    });
});






//함수
	function unix_timestamp(t){
	    var date = new Date(t*1000);
	    var year = date.getFullYear();
	    var month = "0" + (date.getMonth()+1);
	    var day = "0" + date.getDate();
	    var hour = "0" + date.getHours();
	    var minute = "0" + date.getMinutes();
	    var second = "0" + date.getSeconds();
	    return year + "-" + month.substr(-2) + "-" + day.substr(-2) + "</br> " + hour.substr(-2) + ":" + minute.substr(-2) + ":" + second.substr(-2);
	}
	
	function unix_timestamp_tooltip(t){
	    var date = new Date(t*1000);
	    var year = date.getFullYear();
	    var month = "0" + (date.getMonth()+1);
	    var day = "0" + date.getDate();
	    var hour = "0" + date.getHours();
	    var minute = "0" + date.getMinutes();
	    var second = "0" + date.getSeconds();
	    return year + "-" + month.substr(-2) + "-" + day.substr(-2) + " " + hour.substr(-2) + ":" + minute.substr(-2) + ":" + second.substr(-2);
	}	
	
	function unix_timestamp_onClick(t){
	    var date = new Date(t*1000);
	    var year = date.getFullYear();
	    var month = "0" + (date.getMonth()+1);
	    var day = "0" + date.getDate();
	    var hour = "0" + date.getHours();
	    var minute = "0" + date.getMinutes();
	    var second = "0" + date.getSeconds();
	    return year + "-" + month.substr(-2) + "-" + day.substr(-2) + " " + hour.substr(-2) + ":" + minute.substr(-2) + ":" + second.substr(-2);
	}	



//펜 select태그 로드
function getPenGroupSelect(){
    $.ajax({
        url: "/donghwa/analysis/historyTrendPenGroupSelect",
        method: "POST",
        data: {},
        dataType: "json",
        success: function(data) {
        	var result = data.result;
        	
        	var option = "";
        	$("#pen-group").empty();
        	var penName = "";
        	
        	for(var i=0; i<result.length; i++){
        		option = "<option value='"+result[i]+"'>"+result[i]+"</option>";
        		$("#pen-group").append(option);
        	}
        }
    });
}

//펜 select태그의 펜 목록 조회(Pen List)
function getPenGroupList(){
	var selectedGroup = $("#pen-group").val();
    
    $.ajax({
        url: "/donghwa/analysis/historyTrendPenGroupList",
        method: "POST",
        data: {"pen_group_name": selectedGroup},
        dataType: "json",
        success: function(data) {
            var result = data.result;
            
            var option = "";
            
            $("#pen-list").empty();
            console.log(result);
            
            
            for(var i=0; i<result.length; i++){
            	//2025-02-20 수정
                var penInfoName = "";

                penInfoName = result[i].pen_info_name_view;
/*            	
                if(result[i].pen_info_name == "c1"){
                    penInfoName = "Zone 1.1";
                }else if(result[i].pen_info_name == "c2"){
                    penInfoName = "Zone 1.2";
                }else if(result[i].pen_info_name == "c3"){
                    penInfoName = "Zone 2.1";
                }else if(result[i].pen_info_name == "c4"){
                    penInfoName = "Zone 2.2";
                }else if(result[i].pen_info_name == "c5"){
                    penInfoName = "Zone 3.1";
                }else if(result[i].pen_info_name == "c6"){
                    penInfoName = "Zone 3.2";
                }else if(result[i].pen_info_name == "c7"){
                    penInfoName = "Protect 1";
                }else if(result[i].pen_info_name == "c8"){
                    penInfoName = "Temp-load-1";
                }else if(result[i].pen_info_name == "c9"){
                    penInfoName = "Temp-load-2";
                }else if(result[i].pen_info_name == "c10"){
                    penInfoName = "Temp-load-3";
                }else if(result[i].pen_info_name == "c11"){
                    penInfoName = "Temp-load-4";
                }else if(result[i].pen_info_name == "c12"){
                    penInfoName = "Temp-load-5";
                }else if(result[i].pen_info_name == "c13"){
                    penInfoName = "Temp-load-6";
                }else if(result[i].pen_info_name == "c14"){
                    penInfoName = "Temp-load-7";
                }else if(result[i].pen_info_name == "c15"){
                    penInfoName = "Temp-load-8";
                }else if(result[i].pen_info_name == "c16"){
                    penInfoName = "Temp-load-9";
                }else if(result[i].pen_info_name == "c17"){
                    penInfoName = "Temp-load-10";
                }else if(result[i].pen_info_name == "c18"){
                    penInfoName = "Temp-load-11";
                }else if(result[i].pen_info_name == "c19"){
                    penInfoName = "Temp-load-12";
                }else if(result[i].pen_info_name == "c20"){
                    penInfoName = "Temp-load-13";
                }else if(result[i].pen_info_name == "c21"){
                    penInfoName = "Temp-load-14";
                }else if(result[i].pen_info_name == "c22"){
                    penInfoName = "Temp-load-15";
                }else if(result[i].pen_info_name == "cs1"){
                    penInfoName = "Current Load";
                }else if(result[i].pen_info_name == "cs2"){
                    penInfoName = "Set Load";
                }else if(result[i].pen_info_name == "cs3"){
                    penInfoName = "Front Press";
                }else if(result[i].pen_info_name == "cs4"){
                    penInfoName = "Rear Press";
                }else if(result[i].pen_info_name == "cs5"){
                    penInfoName = "force-sensor-1";
                }else if(result[i].pen_info_name == "cs6"){
                    penInfoName = "force-sensor-2";
                }else if(result[i].pen_info_name == "cs7"){
                    penInfoName = "force-sensor-3";
                }else if(result[i].pen_info_name == "cs8"){
                    penInfoName = "force-sensor-4";
                }else if(result[i].pen_info_name == "cs9"){
                    penInfoName = "force-sensor-5";
                }else if(result[i].pen_info_name == "cs10"){
                    penInfoName = "force-sensor-6";
                }else if(result[i].pen_info_name == "cs11"){
                    penInfoName = "force-sensor-7";
                }else if(result[i].pen_info_name == "cs12"){
                    penInfoName = "force-sensor-8";
                }else if(result[i].pen_info_name == "cs13"){
                    penInfoName = "force-sensor-9";
                }else if(result[i].pen_info_name == "cs14"){
                    penInfoName = "force-sensor-10";
                }else if(result[i].pen_info_name == "cs15"){
                    penInfoName = "force-sensor-11";
                }else if(result[i].pen_info_name == "cs16"){
                    penInfoName = "force-sensor-12";
	            }else if(result[i].pen_info_name == "pr1"){
	                penInfoName = "furnace-vacuum";
	            }else if(result[i].pen_info_name == "pr2"){
	                penInfoName = "diffusion-pump";
	            }
*/
		      	if(result[i].pen_info_yn == 'Y'){
            		option = "<option value='"+result[i].pen_info_name+"' style='background-color:lightgray;'>"+penInfoName+"</option>";
            	}else if(result[i].pen_info_yn == 'N'){
            		option = "<option value='"+result[i].pen_info_name+"'>"+penInfoName+"</option>";
            	}
            	
            	$("#pen-list").append(option);	
            }
            
            
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error('Error fetching data:', textStatus, errorThrown);
        }
    });
}

//선택한 펜의 차트 조회
function getPenGroupChartData() {
    // 오늘 날짜 구하기
    var today = new Date();
    var oneWeekAgo = new Date();
    oneWeekAgo.setDate(today.getDate() - 7);

    // YYYY-MM-DD 형식으로 변환 (반대로 설정)
    var sdate = oneWeekAgo.toISOString().split("T")[0]; // 일주일 전 날짜 (시작)
    var edate = today.toISOString().split("T")[0];  // 오늘 날짜 (종료)

    var stime = "00:00";
    var etime = "23:59";

    var sdateTime = sdate + " " + stime + ":00";
    var edateTime = edate + " " + etime + ":59";

    // 콘솔에 값 출력
    console.log("시작 날짜 시간:", sdateTime);
    console.log("종료 날짜 시간:", edateTime);

    var selectedGroup = $("#pen-group").val();

    $.ajax({
        url: "/donghwa/analysis/historyTrendPenGroupChart",
        type: "post",
        dataType: "json",
        data: {
            "sdateTime": sdateTime,
            "edateTime": edateTime,
            "pen_group_name": selectedGroup
        },
        success: function (result) {
            var data = result.data;
            var groupConcatSplit = data.groupConcat.split(",");

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

function getPenGroupChart(){
    const chart = Highcharts.chart('container', {
        chart: {
            type: "spline",
            panning: true,
            panKey: "shift",
            zoomType: "x",
            styleMode: true,
            height: 880,  // 차트 높이 설정
            width: 1490   // 차트 너비 설정
        },
        time: {
            timezone: "Asia/Seoul",
            useUTC: false
        },
        yAxis: [
            {
                min:0,
                max:1800,
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
            	min: 0.0000000001,
            	max: 100000000
,
            	tickInterval: 1e7,  // 적절한 간격을 설정하세요.
                crosshair: {
                    width: 1,
                    color: '#5D5D5D',
                    zIndex: 5
                },
                title: {
                    text: 'Pressure[mbar]'
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
                max:9,
                crosshair: {
                    width: 3,
                    color: '#5D5D5D',
                    zIndex: 5
                },
                title: {
                    text: 'Force[kN]'
                },
                labels: {
                	format: '{value} K' ,
                    style: {
                        fontSize: "14pt"
                    }
                }
            },
            {
                min:0,
                max:450,
                crosshair: {
                    width: 3,
                    color: '#5D5D5D',
                    zIndex: 5
                },
                title: {
                    text: 'Position[mm]'
                },
                labels: {
         /*        	format: '{value} mm', */
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
        tooltip: {
            split: true,
            shared: true,
            style: {
                fontSize: "14pt"
            }
        },
        series: seriesArray,
        responsive: {
            rules: [{
                condition: {
                    maxWidth: 1300
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




</script>
</body>
</html>