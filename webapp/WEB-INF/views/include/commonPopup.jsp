<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="../include/pluginpage.jsp"/>
  
    <meta charset="UTF-8">
    <title>SEND</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f7fc;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    #popupOverlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.6);
        z-index: 999;
    }

    #commonPopup {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 350px;
        height: 300px;
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        z-index: 1000;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-around;
        padding: 20px;
        text-align: center;
    }

    .close-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 22px;
        font-weight: bold;
        cursor: pointer;
        color: #888;
        background: none;
        border: none;
    }

    .close-btn:hover {
        color: #f44336;
    }

    h3 {
        margin: 0;
        font-size: 22px;
        color: #333;
    }

    .toggle-btn, .bt_on, .bt_off, .bt_send {
        padding: 12px 25px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 8px;
        border: none;
        transition: all 0.3s;
        width: 230px;
        height: 50px;
    }

    .toggle-btn {
        margin-top: 15px;
        font-weight: bold;
    }

    .on-btn {
        background-color: #4CAF50;
        color: white;
    }

    .off-btn {
        background-color: #f44336;
        color: white;
    }

    .bt_on {
        background-color: #4CAF50;
        color: white;
    }

    .bt_off {
        background-color: #f44336;
        color: white;
    }

    .bt_send {
        background-color: #888888;
        color: white;
    }

    .toggle-btn:hover, .bt_on:hover, .bt_off:hover, .bt_send:hover {
        opacity: 0.8;
    }

    .spinner {
        border: 4px solid #f3f3f3;
        border-top: 4px solid #3498db;
        border-radius: 50%;
        width: 40px;
        height: 40px;
        animation: spin 1s linear infinite;
        margin-top: 20px;
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    #loadingOverlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.4);
        z-index: 9999;
        justify-content: center;
        align-items: center;
        display: flex;
    }
    
    .tage-name {
        font-size: 29px;
        font-weight: bold;
    }

    #pop { 
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 350px;
        height: 300px;
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        z-index: 1000;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-around;
        padding: 20px;
        text-align: center;
    }

    button {}

    #greenButton {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        margin: 5px;
        width: 230px;
        height: 50px;
    }

    #redButton {
        background-color: #f44336;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        margin: 5px;
        width: 230px;
        height: 50px;
    }

    #sendButton {
        background-color: #888888;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        margin: 5px;
        width: 230px;
        height: 50px;
    }

    .close-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 20px;
        background: none;
        border: none;
        color: #333;
        cursor: pointer;
        font-weight: bold;
        font-size: 22px;
    }

    button.disabled {
        background-color: gray;
        cursor: not-allowed;
    }

    .close-btn:hover {
        color: red;
    }

    h3 {
        margin: 0;
        font-size: 25px;
        color: #333;
    }

    #pop2 { 
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 350px;
        height: 300px;
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        z-index: 1000;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-around;
        padding: 20px;
        text-align: center;
    }

    button {}

    #greenButton2 {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        margin: 5px;
        width: 230px;
        height: 50px;
    }

    #redButton2 {
        background-color: #f44336;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        margin: 5px;
        width: 230px;
        height: 50px;
    }

    #sendButton2 {
        background-color: #888888;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        margin: 5px;
        width: 230px;
        height: 50px;
    }

    .close-btn2 {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 20px;
        background: none;
        border: none;
        color: #333;
        cursor: pointer;
        font-weight: bold;
        font-size: 22px;
    }

    button.disabled {
        background-color: gray;
        cursor: not-allowed;
    }

    .close-btn:hover {
        color: red;
    }
</style>

</head>
<body>


<!-- 로딩 오버레이 및 스피너 -->
<div id="loadingOverlay">
    <div class="spinner"></div>
</div>

<!-- 팝업 오버레이 -->
<div id="popupOverlay" onclick="closePopup()"></div>



<!-- 팝업 내용 -->
<div id="commonPopup">
    <button class="close-btn" onclick="closePopup()">✖</button>
    <div class="tage-name"></div>
    <button class="bt_on" type="button">ON</button>
 	 <button class="bt_off" type="button" style="display: none;">OFF</button>
 
    
    <button class="bt_send" type="button" onclick="valueDigitalSend();">전송</button>
</div>




	<div id="pop">
	   <h3>front-clamp</h3>
	 <button id="closeButton" class="close-btn">X</button>
	    <button id="greenButton"class="greenButton front-on-M8140">OPEN</button>
	    <button id="redButton"class="redButton front-off-M8089">CLOSE</button>
	    <button id="sendButton"class="sendButton">전송</button>
	</div>
	
	<div id="pop2">
	   <h3>rear-clamp</h3>
	    <button id="closeButton2" class="close-btn2">X</button>
	    <button id="greenButton2" class="greenButton rear-on-M8143">OPEN</button>
	    <button id="redButton2" class="redButton rear-off-M8090">CLOSE</button>
	    <button id="sendButton2" class="sendButton2">전송</button>
	</div>



<script>
    var setTagDir = "";
    var setTagName = "";
    var setTagValue = 0;

    window.onload = function() {
    	document.getElementById('pop').style.display = 'none';
    	document.getElementById('pop2').style.display = 'none';
        document.getElementById('popupOverlay').style.display = 'none';
        document.getElementById('commonPopup').style.display = 'none';
        document.getElementById('loadingOverlay').style.display = 'none'; // 로딩 스피너 숨기기
    };

    // ON/OFF 버튼 이벤트
    $(".bt_on").on("click", function(e){
        $(".bt_on").css("background-color","blue");
        $(".bt_off").css("background-color","#F0F0F0");
        setTagValue = 1;
    });

    $(".bt_off").on("click", function(e){
        $(".bt_off").css("background-color","blue");
        $(".bt_on").css("background-color","#F0F0F0");
        setTagValue = 0;
    });

    // 팝업 열기
    function openPopup(value) {
        document.getElementById('popupOverlay').style.display = 'block';
        document.getElementById('commonPopup').style.display = 'flex';
    }

    // 팝업 닫기
    function closePopup() {
        document.getElementById('popupOverlay').style.display = 'none';
        document.getElementById('commonPopup').style.display = 'none';
    }

    // ON/OFF 버튼 상태 토글
    function togglePopup() {
        var button = document.getElementById('toggleButton');
        if (button.classList.contains('on-btn')) {
            button.classList.remove('on-btn');
            button.classList.add('off-btn');
            button.textContent = 'OFF';
        } else {
            button.classList.remove('off-btn');
            button.classList.add('on-btn');
            button.textContent = 'ON';
        }
    }

    function digitalSet(tagDir, tagName){
        console.log(tagDir+"// "+tagName);
        console.log(tagName);
        setTagDir = tagDir;
        setTagName = tagName;
        console.log("digitalSet실행");
        $(".tage-name").text(setTagName);
        $(".bt_off").css("display", "none"); // 또는 "block"
        openPopup();
    }
/* 
    function digitalSetOnOff(tagDir, tagName){
        console.log(tagDir+"// "+tagName);
        console.log(tagName);
        console.log("digitalSetOnOff실행");
        setTagDir = tagDir;
        setTagName = tagName;
        $(".tage-name").text(setTagName);
        $(".bt_off").css("display", "inline-block"); // 또는 "block"
        openPopup('b');
    } */

    // 전송 함수 (AJAX 포함)
    function valueDigitalSend() {
        var sendTagDir = setTagDir;
        var sendTagName = setTagName;
        var sendTagValue = setTagValue == 1 ? true : false;

        console.log(sendTagDir);
        console.log(sendTagName);
        console.log(sendTagValue);

        // 로딩 스피너 보이기
        document.getElementById('loadingOverlay').style.display = 'flex';

        $.ajax({
            url: "/donghwa/common/valueDigitalSet",
            type: "post",
            dataType: "json",
            data: {
                "sendTagDir": sendTagDir,
                "sendTagName": sendTagName,
                "sendTagValue": sendTagValue
            },
            success: function(result) {
                console.log(result);
                // 로딩 스피너 숨기기
                document.getElementById('loadingOverlay').style.display = 'none';
            },
            error: function(xhr, status, error) {
                console.error("전송 실패", status, error);
                // 로딩 스피너 숨기기
                document.getElementById('loadingOverlay').style.display = 'none';
            }
        });
    }







    function digitalSetOnOff() {
        console.log("digitalSetOnOff 함수 실행됨");
        document.getElementById('commonPopup').style.display = 'flex'; // 팝업을 보이게 함
    }





    window.onclick = function(event) {
        if (event.target === document.getElementById('pop')) {
            document.getElementById('pop').style.display = 'none';
        }
    };

    document.getElementById('closeButton').onclick = function() {
        document.getElementById('pop').style.display = 'none';
    };

    // ON/OFF 버튼 이벤트
    $(".greenButton").on("click", function(e){
        $(".greenButton").css("background-color","blue");
        $(".redButton").css("background-color","#F0F0F0");
        setTagValue = 1;
    });

    $(".redButton").on("click", function(e){
        $(".redButton").css("background-color","blue");
        $(".greenButton").css("background-color","#F0F0F0");
        setTagValue = 1;
    });



 // 버튼 클릭 시 처리
    document.getElementById("sendButton").onclick = function() {
        var sendTagDir = "DONGHWA.FURNACE.MANUAL_OPERATION"; // 고정값
        var sendTagValue = true; // 트루로 설정
        
        // 클릭된 버튼을 확인하여 해당 버튼의 두 번째 클래스명을 가져옴
        var sendTagName = "";
        
        if (document.getElementById("greenButton").classList.contains("clicked")) {
            sendTagName = document.getElementById("greenButton").classList[1]; // second class of greenButton
        } else if (document.getElementById("redButton").classList.contains("clicked")) {
            sendTagName = document.getElementById("redButton").classList[1]; // second class of redButton
        }
        
        if (sendTagName) {
            // 전송 함수 호출
            valueDigitalSend_front(sendTagDir, sendTagName, sendTagValue);
        } else {
            console.log("No button clicked");
        }
    };

    // 버튼 클릭 시 clicked 클래스 추가
    document.getElementById("greenButton").onclick = function() {
        this.classList.add("clicked");
        document.getElementById("redButton").classList.remove("clicked"); // redButton에서 clicked 클래스 제거
    };

    document.getElementById("redButton").onclick = function() {
        this.classList.add("clicked");
        document.getElementById("greenButton").classList.remove("clicked"); // greenButton에서 clicked 클래스 제거
    };

    function valueDigitalSend_front(sendTagDir, sendTagName, sendTagValue) {
        // 로딩 스피너 보이기
        document.getElementById('loadingOverlay').style.display = 'flex';

        $.ajax({
            url: "/donghwa/common/valueDigitalSet",
            type: "post",
            dataType: "json",
            data: {
                "sendTagDir": sendTagDir,
                "sendTagName": sendTagName,
                "sendTagValue": sendTagValue
            },
            success: function(result) {
                console.log(result);
                // 로딩 스피너 숨기기
                document.getElementById('loadingOverlay').style.display = 'none';
            },
            error: function(xhr, status, error) {
                console.error("전송 실패", status, error);
                // 로딩 스피너 숨기기
                document.getElementById('loadingOverlay').style.display = 'none';
            }
        });
    }



























    function digitalSetOnOff2() {
        console.log("digitalSetOnOf2222222222222f 함수 실행됨");
        document.getElementById('pop2').style.display = 'flex'; // 팝업을 보이게 함
    }




/* 
    window.onclick = function(event) {
        if (event.target === document.getElementById('pop2')) {
            document.getElementById('pop2').style.display = 'none';
        }
    };
 */
    document.getElementById('closeButton2').onclick = function() {
        document.getElementById('pop2').style.display = 'none';
    };

    // ON/OFF 버튼 이벤트
    $(".greenButton2").on("click", function(e){
        $(".greenButton2").css("background-color","blue");
        $(".redButton2").css("background-color","#F0F0F0");
        setTagValue = 1;
    });

    $(".redButton2").on("click", function(e){
        $(".redButton2").css("background-color","blue");
        $(".greenButton2").css("background-color","#F0F0F0");
        setTagValue = 1;
    });

    


 // 버튼 클릭 시 처리
    document.getElementById("sendButton2").onclick = function() {
        var sendTagDir = "DONGHWA.FURNACE.MANUAL_OPERATION"; // 고정값
        var sendTagValue = true; // 트루로 설정
        
        // 클릭된 버튼을 확인하여 해당 버튼의 두 번째 클래스명을 가져옴
        var sendTagName = "";
        
        if (document.getElementById("greenButton2").classList.contains("clicked")) {
            sendTagName = document.getElementById("greenButton2").classList[1]; // second class of greenButton
        } else if (document.getElementById("redButton2").classList.contains("clicked")) {
            sendTagName = document.getElementById("redButton2").classList[1]; // second class of redButton
        }
        
        if (sendTagName) {
            // 전송 함수 호출
            valueDigitalSend_front(sendTagDir, sendTagName, sendTagValue);
        } else {
            console.log("No button clicked");
        }
    };

    // 버튼 클릭 시 clicked 클래스 추가
    document.getElementById("greenButton2").onclick = function() {
        this.classList.add("clicked");
        document.getElementById("redButton2").classList.remove("clicked"); // redButton에서 clicked 클래스 제거
    };

    document.getElementById("redButton2").onclick = function() {
        this.classList.add("clicked");
        document.getElementById("greenButton2").classList.remove("clicked"); // greenButton에서 clicked 클래스 제거
    };

    function valueDigitalSend_front(sendTagDir, sendTagName, sendTagValue) {
        // 로딩 스피너 보이기
        document.getElementById('loadingOverlay').style.display = 'flex';

        $.ajax({
            url: "/donghwa/common/valueDigitalSet",
            type: "post",
            dataType: "json",
            data: {
                "sendTagDir": sendTagDir,
                "sendTagName": sendTagName,
                "sendTagValue": sendTagValue
            },
            success: function(result) {
                console.log(result);
                // 로딩 스피너 숨기기
                document.getElementById('loadingOverlay').style.display = 'none';
            },
            error: function(xhr, status, error) {
                console.error("전송 실패", status, error);
                // 로딩 스피너 숨기기
                document.getElementById('loadingOverlay').style.display = 'none';
            }
        });
    }




    

</script>

</body>
</html>
