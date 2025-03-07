<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

       <jsp:include page="../include/pluginpage.jsp"/>
   
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            padding-bottom: 100px;
        }

        .footer {
            display: flex;
            background-color: #123478;
            color: white;
           
            padding-left: 200px;
            align-items: center;
            font-size: 18px;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 120px;
            justify-content: space-around;
            gap: 20px;
        }

		.footer .section {
		    padding: 5px; /* 패딩을 줄여서 크기를 작게 */
		    flex: 0.8; /* flex를 줄여서 크기 비율을 줄임 */
		}


        .footer p {
             padding: 4px;
        }

        .footer .buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
            align-items: center;
        }

        .button {
            width: 88px;
            height: 88px;
            background-color: #5a738e;
            border-radius: 15px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }

        .button img {
            width: 40px;
            height: 40px;
        }

        .tabulator {
            width: 100%;
            max-width: 500px;
            height: 100px;
            border-collapse: collapse;
            background-color: #f0f0f0;
            color: black;
            font-weight: bold;
            border-radius: 8px;
            overflow-y: scroll;
            margin: 0 auto;
            margin-left: 70px;
        }

        .tabulator td, .tabulator th {
            text-align: center;
            border: 1px solid #ccc;
            padding: 10px;
        }

        .tabulator th {
            background-color: #808080 !important;
        }

        .tabulator td {
            background-color: #666666 !important;
            text-align: left;
        }

        .tabulator td.eventText {
            width: 80%;
        }

        .tabulator td.status {
            width: 20%;
        }

        .dynamic-value {
            color: gray;
        }

        .dynamic-value.null {
            color: gray;
        }

        .section {
            margin-left: 50px;
  
           
        }

        .section status {
            margin-left: 70px;
             margin-top: 10px;
        }
        
    .button-container {
	  position: absolute;
	  left: 21px;
	  top: 66px;
	  display: flex; /* 버튼을 가로로 정렬 */
	  gap: 10px; /* 버튼 간격 */
	}
	
	.button {
	  width: 84px;
	  height: 84px;
	  border-radius: 20px;
	  background-color: #5A6D8A; /* 연한 남색 */
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  cursor: pointer;
	  transition: background-color 0.3s ease, transform 0.2s ease;
	}
	
	.button img {
	  width: 53px;
	  height: 53px;
	  object-fit: contain;
	}
	
	.button:hover {
	  background-color: #4C5C77; /* 호버 시 색상 변경 */
	  transform: scale(1.05);
	}
	
	.button:active {
	  background-color: #3A4A66;
	  transform: scale(0.95);
	}
	
	.status-ab {
	    width: 333px;
	    margin-left: 30px;
	    margin-top:5px;
	}
	
	.status-ab p {
	    margin-bottom: 11px; 
	}

	.st1 {
	    width: 250px;
	    position: absolute;
	    top: 5px;
	    left: 2150px;
	    font-weight: bold;
	}
	
	.st2 {
	    width: 250px;
	    position: absolute;
	    top: 47px;
	    left: 2150px;
	    font-weight: bold;
	}
	
	.st3 {
	    width: 250px;
	    position: absolute;
	    top: 85px;
	    left: 2150px;
	    font-weight: bold;
	}
	.ST1-M8040{
	top:28px;
	 position: absolute;
	
	}



    </style>
</head>
<body>

<div class="footer">
    <div class="section">
        <p><strong>Prg.Number:</strong> <span class="programNumber">NULL</span></p>
        <p><strong>Prg.Name:</strong> <span class="programName R7100-name-rover">NULL</span></p>
        <p><strong>Prg.Comment:</strong> <span class="programComment R7000-comment-rover">NULL</span></p>
    </div>
    <div class="section">
        <p><strong>Segment number:</strong> <span class="segmentNumber D-7948">NULL</span></p>
        <p><strong>Seg.remaining time:</strong> <span class="segRemainingTime D-7950">NULL</span></p>
        <p><strong>Prg.remaining time:</strong> <span class="prgRemainingTime">NULL</span></p>
    </div>
    <div class="buttons">
        <div class="button bt_pause"><img src="/donghwa/css/furnace/img/pause3.png" alt="Stop"></div>
        <div class="button bt_fire lamp-8030"><img src="/donghwa/css/furnace/img/fire3.png" alt="Warning"></div>
        <div class="button bt_man lamp-8031"><img src="/donghwa/css/furnace/img/danger3.png" alt="Alarm"></div>
        <div class="button bt_death lamp-8032"><img src="/donghwa/css/furnace/img/death3.png" alt="Info"></div>
        <div class="button bt_sound lamp-8033"><img src="/donghwa/css/furnace/img/sound3.png" alt="no_sound"></div>
        <div class="button bt_siren M8034" onclick="openPopup2()" ><img src="/donghwa/css/furnace/img/siren3.png" alt="alarm"></div>
     <!--   <div class="button bt_reset M-8035"><img src="/donghwa/css/furnace/img/reset3.png" alt="alarm"></div> --> 
    </div>
	<div id="tabulator-table2" class="tabulator"></div> 
 


	<div class="status-ab">
	    <p><strong>Status 1:</strong> <span class="status1"></span></p>
	    <div class="ST1-M8040 st1">AUTO </div>
	    <div class="ST1-M8041 st1">Manual </div>        
	    <div class="ST1-M8042 st1">Heating vacuum </div> 
	    <div class="ST1-M8043 st1">Heating gas stationary </div>
	    <div class="ST1-M8044 st1">Cooling vacuum</div>
	    <div class="ST1-M8045 st1">Cooling gas stationary </div> 
	
	    <p><strong>Status 2:</strong> <span class="status2"></span></p>
	
	    <div class="ST2-M8051 st2">MANUAL LEAK TEST (REPEAT 1ST)</div>
	    <div class="ST2-M8052 st2">MANUAL LEAK TEST (REPEAT 2ND) </div>       
	    <div class="ST2-M8053 st2">LEAK TEST OK </div>       
	    <div class="ST2-M8054 st2">LEAK TEST FAIL</div>     
	    <div class="ST2-M8138 st2">MANUAL LEAKTEST LAMP </div>
	
	    <p><strong>Status 3:</strong> <span class="status3"></span></p>
	
	    <div class="ST3-M8060 st3">Ram in upper position </div>       
	    <div class="ST3-M8061 st3">pressing loop </div>       
	    <div class="ST3-M8062 st3">auto bonding</div>      
	</div>


</div>

<script>

function openPopup2() {
    // 팝업 창의 크기
    var width = 700;
    var height = 700;
    

    var left = window.screenX + (window.innerWidth - width) / 3;
    var top = window.screenY + (window.innerHeight - height) / 3.5;
    window.open('/donghwa/analysis/alarmData', 'alarmPopup', 
                'width=' + width + ',height=' + height + 
                ',top=' + top + ',left=' + left + 
                ',scrollbars=yes,resizable=yes');
}

    function fetchAlarmData() {
        $.ajax({
            url: "/donghwa/analysis/alarmHistory/alarmlistOverivew", 
            method: "POST",
            dataType: "json",
            success: function(data) {
                table.setData(data);  
              
            },
            error: function() {
                console.error("데이터를 가져오는 데 실패했습니다.");
            }
        });
    }

    document.addEventListener("DOMContentLoaded", function () {
        const pauseButton = document.querySelector('.bt_pause');

        if (pauseButton) {
            pauseButton.addEventListener('click', function () {
                window.open(
                    "/donghwa/furnace/automaticProgramPop2",  
                    "popupWindow",  
                    "width=508,height=392,left=730,top=235,menubar=no,toolbar=no,scrollbars=no,status=no,location=no,directories=no,resizable=no"
                );
            });
        } else {
            console.error("bt_pause 요소를 찾을 수 없습니다.");
        }

        // 페이지 로드 시 한 번 실행
        fetchAlarmData();

        // 10초마다 데이터 갱신
        setInterval(fetchAlarmData, 10000);
    });

    var tableData2 = []; 

    var table = new Tabulator("#tabulator-table2", {
        height: 100,
        data: tableData2, 
        layout: "fitColumns",
        selectable: true,    
        tooltips: true,
        selectableRangeMode: "click",
        reactiveData: true,
        headerHozAlign: "center",
        columns: [
            { title: "ALARMDESC", field: "alarmDesc", width: 270, hozAlign: "center" },
            { title: "START TIME", field: "time", width: 200, hozAlign: "center" }
        ],
        placeholder: "검색 결과가 없습니다."
    });


    $(".lamp-8033").click(function () {
        $.ajax({
            url: "/donghwa/common/valueDigitalSet",
            type: "POST",
            dataType: "json",
            data: {
                "sendTagDir": "DONGHWA.OVERVIEW", 
                "sendTagName": "lamp-8033",
                "sendTagValue": 1
            },
            success: function(result) {
                console.log("전송 성공:", result);
            },
            error: function(xhr, status, error) {
                console.error("전송 실패", status, error);
            }
        });
    });





</script>



</body>
</html>
