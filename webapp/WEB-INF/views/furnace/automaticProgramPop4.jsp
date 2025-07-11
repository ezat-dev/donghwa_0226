<%@ page session="true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <jsp:include page="../include/commonPopup.jsp"/>
<link rel="stylesheet" href="/donghwa/css/furnace/automaticProgramPop4.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<!-- Flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!-- 한국어 로케일 -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>


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
   .automatic-text, .programmer-text, .startconditions-text, .batch-data-text {
    transition: all 0.3s ease;
    cursor: pointer;
	}
	
	.automatic-text:hover,
	.programmer-text:hover,
	.startconditions-text:hover,
	.batch-data-text:hover {
	    color: white;
	    transform: scale(1.05);
	}
   .setSeconds{
   
   	font-size: 16pt;
    position: absolute;
	left: 533px;
    top: 324px;
   }
   
   
   
   
	#tx1 {
	    font-size: 16pt;
	    position: absolute;
	    left: 246px;
	    top: 288px;
	    width: 380px;
	    color: #ed0f0f;
	}
   
   .realTime{
   
   	font-size: 16pt;
    position: absolute;
	left: 449px;
    top: 324px;
   }
   .mins{
    font-size: 16pt;
    position: absolute;
	left: 356px;
    top: 330px;
   }
   /* 화면 하단 고정 컨테이너 */
#minuteCalc-container {
  position: fixed;
  bottom: 20px;
  left: 50%;
  transform: translateX(-50%);
  background: #fff;
  padding: 10px 15px;
  border-radius: 6px;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  text-align: center;
  z-index: 1000;
}

#minuteCalc {
  font-size: 14pt;
  width: 260px;
  padding: 6px 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
  text-align: center;
  background-color: #fafafa;
  cursor: pointer;
  transition: border-color .2s ease, box-shadow .2s ease;
}

#minuteCalc:hover { border-color: #888; }
#minuteCalc:focus {
  outline: none;
  border-color: #558bff;
  box-shadow: 0 0 4px rgba(85,139,255,0.3);
}

   </style>
  <title>Document</title>
</head>
<body>

    <div class="auto-pro-box"></div>
    <div class="auto-pro-header"></div>
    <div class="auto-pro-main"></div>
    <div class="automatic-program">Automatic program</div>

  <img class="close2" src="close1.png" />
  <div class="automatic"></div>
  <div class="automatic-text"onclick="movePage('/donghwa/furnace/automaticProgramPop4')">Automatic</div>
  <div class="programmer"></div>
  <div class="programmer-text" onclick="movePage('/donghwa/furnace/automaticProgramPop2')">Programmer</div>
  <div class="start-conditions"></div>
  <div class="startconditions-text" onclick="movePage('/donghwa/furnace/automaticProgramPop3')">Startconditions</div>
  <div class="batch-data"></div>
  <div class="batch-data-text" onclick="movePage('/donghwa/furnace/automaticProgramPop1')">Batch data</div>
  
    
    
    <div id="tx1">*최대 32767분 입력 가능(22일 18시간)*</div>
    
    <div class="program-number-box"></div>
    <div class="program-number-text">Program Number</div>
    <div class="program-name-box"></div>
    <div class="program-name-text">Program Name</div>
    <div class="program-comment-box"></div>
    <div class="program-comment-text">Program Comment</div>
    <div class="id-box"></div>
    <div class="id-text">ID 0</div>
    <div class="program-number-value"></div>
    <div class="program-name-value"></div>
    <div class="program-comment-value"></div>
    <div class="id-value"></div>
    <div class="start-real start_bt_M8001 asd-start_on_M8005"></div>
    <div class="start-text">Start</div>
    <div class="start-delay start "></div>
    <div class="start-delay-text ">Start delay</div>
    <div class="reset"></div>
    <div class="reset-text">Reset</div>
    <div class="_1 delayTime"></div>
    
    <div class="_2"></div>
     <div class="realTime"></div>
    <div class="setSeconds"></div>
    <div class="mins">분</div>
       <div class="setHour">시</div>
    <div class="_12 "></div>
    <div class="_22"></div>
    <div class="_3"></div>



   <script>


    var overviewInterval;

    //로드
    $(function(){
    	overviewListView();
    	overviewInterval = setInterval("overviewListView()", 500);


    	  $("#minuteCalc").datetimepicker({
    		    dateFormat: "yy-mm-dd",
    		    timeFormat: "HH:mm",
    		    controlType: 'select',
    		    oneLine: true,
    		    onClose: calculateMinutesDiff,  // 선택 완료 시 호출
    		  });
    		});

    		// 선택된 일시(dateText 예: "2025-06-13 14:30")로 분 차이를 계산
    		function calculateMinutesDiff(dateText) {
    		  if (!dateText) return;

    		  // ISO8601 형식으로 바꿔서 파싱 (" " → "T")
    		  const dt = new Date(dateText.replace(" ", "T"));
    		  if (isNaN(dt)) {
    		    $("#minuteCalc").val("잘못된 일시");
    		    return;
    		  }

    		  const now = new Date();
    		  const diffMs = now - dt;
    		  const diffMin = Math.floor(diffMs / 60000);

    		  $("#minuteCalc").val(diffMin < 0 ? 0 : diffMin);
    		}


    		
  //OPC값 알람 조회
   function overviewListView() {
    $.ajax({
        url: "/donghwa/furnace/automaticProgramPop4/view",
        type: "post",
        dataType: "json",
        success: function (result) {
            var data = result.multiValues;

            for (let key in data) {
                for (let keys in data[key]) {
                    var d = data[key];

                    if (d[keys].action == "v") {
                    	//console.log("v() 호출: keys =", keys, ", value =", d[keys].value);
                        v(keys, d[keys].value);
                    } else if (d[keys].action == "c") {
                        c(keys, d[keys].value);
                    } else if (d[keys].action == "b") {
                        b(keys, d[keys].value);
                    } else if (d[keys].action == "asd") {
                       // console.log("asd() 호출: keys =", keys, ", value =", d[keys].value);
                        asd(keys, d[keys].value);
                    } else if (d[keys].action == "value") {
                    	//console.log("벨류() 호출: keys =", keys, ", value =", d[keys].value);
                        value(keys, d[keys].value);
                    }
                }
            }
        }
    });
}

   function v(keys, value) {
	    // ─── 0. reset 키 처리 ───
	    if (keys === "reset") {
	        const $resetBox = $("._3");
	        if (value === true) {
	            $resetBox.css("background-color", "#ccffcc");
	        } else if (value === false) {
	            $resetBox.css("background-color", "");
	        }
	    }

	    // ─── 1. start_bt_M8001이 true일 때만 _12 클래스에 초록색 5초간 표시 ───
	    if (keys === "start_bt_M8001" && value === true) {
	        const $box = $("._12");
	        $box.css("background-color", "#ccffcc");
	        setTimeout(() => {
	            $box.css("background-color", "");
	        }, 5000);
	    }

	    // ─── 2. 기존 기능 ───
	    if (keys !== "start_bt_M8001") {
	        let element = $("." + keys);

	        if (value === true) {
	            element
	                .attr("onclick",
	                      "digitalSet('DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC', '" + keys + "')")
	                .css("cursor", "pointer")
	                .off("click")
	                .on("click", function () {
	                    digitalSet('DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC', keys);
	                });
	        } else if (value === false) {
	            element
	                .attr("onclick",
	                      "digitalSet('DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC', '" + keys + "')")
	                .css("cursor", "pointer")
	                .off("click")
	                .on("click", function () {
	                    digitalSet('DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC', keys);
	                });
	        } else {
	            element
	                .removeAttr("onclick")
	                .css("cursor", "default")
	                .off("click");
	        }
	        
	    }
	}

	

   function value(keys, value) {
	    // 값 표시 (단위 붙이기)
	    if (!$("div").hasClass("anlog-popup-div-color")) {
	        if (keys === "realTime") {
	            $("." + keys).text(value + "분");
	        } else if (keys === "setSeconds") {
	            $("." + keys).text(value + "초");
	        } else {
	            $("." + keys).text(value);
	        }
	    }

	
	    $("." + keys).css({
	        display: "",
	        "text-align": "center",
	        "font-size": "16pt",
	        "padding-top": "5px",
	        "align-items": "center"
	    });

	    // delayTime만 더블클릭 팝업
	    if (keys === "delayTime") {
	        $("." + keys)
	            .attr("ondblclick", "popupOpenAna('" + keys + "', 'DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC')")
	            .css("cursor", "pointer");
	    }
	} 
/* 
	function value(keys, value) {
	    // 디버깅용: 들어오는 키와 값 확인
	  
	    // 공통 텍스트 처리(필요하면 유지)
	    if (keys === "realTime") {
	        $("." + keys).text(value + "분");
	    } else if (keys === "setSeconds") {
	        $("." + keys).text(value + "초");
	    } else {
	        $("." + keys).text(value);
	    }
	    $("." + keys).css({
	        display: "",
	        "text-align": "center",
	        "font-size": "16pt",
	        "padding-top": "5px",
	        "align-items": "center"
	    });

	    // 오직 asd-start_on_M8005=true 일 때만 연두 배경

	} */

	

  var popup;
  
  function modalClick(location){
      const modal = document.querySelector('.'+location);
      modal.style.display="";
  }
  
  
  

     

    function menuClick(url) {
    	popup.close();
      location.href = url;
    }

    function popupClick(url, popupWidth, popupHeight, customLeft, customTop) {

        var browserWidth = window.innerWidth; // 브라우저 가로 크기
        var browserHeight = window.innerHeight; // 브라우저 세로 크기


        popup = window.open(
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

    function asd(keys, value) {
    	//console.log("asd() 호출: keys =", keys, ", value =", value); 
        if (value == true) {
            $("." + keys).css({
                "color": "#000000",
                "background-color": "",
                "cursor": "pointer"
            });
            $("." + keys).removeAttr("disabled");

        
            $("." + keys).attr("onclick", "digitalSet('DONGHWA.FURNACE.AUTOMATIC_PROGRAM.AUTOMATIC', 'start_bt_M8001')");
        } else {
            $("." + keys).css({
                "color": "#D3D3D3",
                "background-color": "red",
                "cursor": ""
            });
            $("." + keys).attr("disabled", true);
            $("." + keys).removeAttr("onclick");
        }
    }


    function movePage(url) {
        window.location.href = url;
        // 또는 window.location.assign(url);
    }


  </script>
</body>
</html>