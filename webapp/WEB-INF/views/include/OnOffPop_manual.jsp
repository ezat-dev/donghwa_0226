<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 
  
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

        /* 팝업 오버레이 */
        #popupOverlay2 {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 999;
        }

        /* 팝업 */
        #commonPopup2 {
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

        /* 닫기 버튼 */
        .close-btn2 {
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

        .close-btn2:hover {
            color: #f44336;
        }

        /* 제목 */
        h3 {
            margin: 0;
            font-size: 18px;
            color: #333;
        }

        /* 버튼 */
        .toggle-btn2, .bt_on2, .bt_off2, .bt_send2 {
            padding: 12px 25px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 8px;
            border: none;
            transition: all 0.3s;
            width: 230px;
            height:50px;
            
        }

        .toggle-btn2 {
            margin-top: 15px;
            font-weight: bold;
        }

        .on-btn2 {
            background-color: #4CAF50;
            color: white;
        }

        .off-btn2 {
            background-color: #f44336;
            color: white;
        }

        .bt_on2 {
            background-color: #4CAF50;
            color: white;
        }

        .bt_off2 {
            background-color: #f44336;
            color: white;
        }

        .bt_send2 {
            background-color: #888888;
            color: white;
        }

        .toggle-btn2:hover, .bt_on2:hover, .bt_off2:hover, .bt_send2:hover {
            opacity: 0.8;
        }

        /* 로딩 스피너 스타일 */
        .spinner2 {
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

        /* 로딩 오버레이 */
        #loadingOverlay2 {
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
        
        .tage-name2 {
	    font-size: 29px;
	    font-weight: bold;
}
        
    </style>
</head>
<body>
    <div id="loadingOverlay2">
        <div class="spinner2"></div>
    </div>

    <div id="popupOverlay2" onclick="closePopup2()"></div>

    <div id="commonPopup2">
        <h3></h3>
        <button class="close-btn2" onclick="closePopup2()">✖</button>
        <div class="tage-name2"></div>
        <button class="bt_on2" type="button">ON</button>
        <button class="bt_off2" type="button">OFF</button>
        <button class="bt_send2" type="button">전송</button>
    </div>

   
   
   
   <script>
    var sendTagDir2 = "DONGHWA.OVERVIEW";
    var setTagName2 = "";
    var setTagValue2 = 1;  

    window.onload = function() {
        document.getElementById('popupOverlay2').style.display = 'none';
        document.getElementById('commonPopup2').style.display = 'none';
        document.getElementById('loadingOverlay2').style.display = 'none';
    };

    $(document).ready(function() {
        $(".bt_on2").on("click", function(e){
            $(".bt_on2").css("background-color", "blue");
            $(".bt_off2").css("background-color", "#F0F0F0");
            setTagName2 = $(this).attr("class").split(" ")[1];  // 클래스를 통해 setTagName 설정
            setTagValue2 = 1;  
            console.log("ON 버튼 클릭됨");
            console.log("setTagName2:", setTagName2);
            console.log("setTagValue2:", setTagValue2);
        });

        $(".bt_off2").on("click", function(e){
            $(".bt_off2").css("background-color", "blue");
            $(".bt_on2").css("background-color", "#F0F0F0");
            setTagName2 = $(this).attr("class").split(" ")[1]; 
            setTagValue2 = 1;  
            console.log("OFF 버튼 클릭됨");
            console.log("setTagName2:", setTagName2);
            console.log("setTagValue2:", setTagValue2);
        });

        $(".bt_send2").on("click", function() {
            if (!setTagName2) {
                alert("ON/OFF 버튼을 먼저 클릭해주세요.");
                return;
            }
            console.log("전송 시작");
            valueDigitalSend2(sendTagDir2, setTagName2, setTagValue2);
        });
    });

    function valueDigitalSend2(tagDir2, tagName2, tagValue2) {
        console.log("TagDir2:", tagDir2);
        console.log("TagName2:", tagName2);
        console.log("TagValue2:", tagValue2);

        $.ajax({
            url: "/donghwa/common/valueDigitalSet2",
            type: "post",
            dataType: "json",
            data: {
                "sendTagDir2": tagDir2,
                "sendTagName2": tagName2,
                "sendTagValue2": tagValue2
            },
            success: function(result) {
                console.log(result);
                // 로딩 스피너 숨기기
                document.getElementById('loadingOverlay2').style.display = 'none';
            },
            error: function(xhr, status, error) {
                console.error("전송 실패", status, error);
                // 로딩 스피너 숨기기
                document.getElementById('loadingOverlay2').style.display = 'none';
            }
        });
    }

    function openPopup2() {
        document.getElementById('popupOverlay2').style.display = 'block';
        document.getElementById('commonPopup2').style.display = 'flex';
    }

    function closePopup2() {
        document.getElementById('popupOverlay2').style.display = 'none';
        document.getElementById('commonPopup2').style.display = 'none';
    }
</script>

</body>

</html>
