<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/donghwa/css/furnace/globalParameter.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
 <%@ include file="../include/mainHeader.jsp" %>
  
<jsp:include page="../include/pluginpage.jsp"/>
  <title>Document</title>
</head>
<style>
.back {
    background-color: #888;
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 20px;
    text-align: center;
    display: inline-block;
    position: absolute;
    bottom: 20px;
    left: 1542px;
    transition: background-color 0.3s;
}

.save-to-plc {
    background-color: #888;
    color: white;
    padding: 12px 71px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 24px;
    text-align: center;
    display: inline-block;
    position: absolute;
    bottom: 190px;
    left: 1320px;
    transition: background-color 0.3s, transform 0.2s;
}

.back:hover, .save-to-plc:hover {
    background-color: #555;
    transform: scale(1.05); /* 버튼을 약간 확대하는 효과 */
}



</style>

<body style="background-color: #CCCCCC;">
  <div class="group-1">
    <div class="global"></div>
    <div class="global-line"></div>
    <div class="number-text"></div>
    <div class="number">Number</div>
    <div class="number-1"></div>
    <div class="_1">1</div>
    <div class="number-2"></div>
    <div class="_2">2</div>
    <div class="number-3"></div>
    <div class="_3">3</div>
    <div class="number-4"></div>
    <div class="_4">4</div>
    <div class="number-5"></div>
    <div class="_5">5</div>
    <div class="number-6"></div>
    <div class="_6">6</div>
    <div class="number-7"></div>
    <div class="_7">7</div>
    <div class="number-8"></div>
    <div class="_8">8</div>
    <div class="number-9"></div>
    <div class="_9">9</div>
    <div class="number-10"></div>
    <div class="_10">10</div>
    <div class="number-11"></div>
    <div class="_11">11</div>
    <div class="number-12"></div>
    <div class="_12">12</div>
    <div class="number-13"></div>
    <div class="_13">13</div>
    <div class="number-14"></div>
    <div class="_14">14</div>
    <div class="number-15"></div>
    <div class="_15">15</div>
    <div class="number-16"></div>
    <div class="_16">16</div>
    <div class="number-17"></div>
    <div class="_17">17</div>
    <div class="name-text"></div>
    <div class="name">Name</div>
    <div class="name-1"></div>
    <div class="temperature-release-fastcooling">
      Temperature release fastcooling
    </div>
    <div class="name-2"></div>
    <div class="select-hydraulic">Select hydraulic</div>
    <div class="name-3"></div>
    <div class="free-length-of-path-to-batch">Free length of path to batch</div>
    <div class="name-4"></div>
    <div class="speed-pressing-plunger">Speed pressing plunger</div>
    <div class="name-5"></div>
    <div class="maximum-force-load">Maximum force load</div>
    <div class="name-6"></div>
    <div class="maximum-distance-load">Maximum distance load</div>
    <div class="name-7"></div>
    <div class="relieve-distance-z">Relieve distance -z</div>
    <div class="name-8"></div>
    <div class="limit-of-distance-z">Limit of distance +z</div>
    <div class="name-9"></div>
    <div class="limit-unsymmetrical-load">Limit unsymmetrical load</div>
    <div class="name-10"></div>
    <div class="batch-tc-1-typ-n-pos-4-26">Batch TC 1 (Typ N) Pos 4.26</div>
    <div class="name-11"></div>
    <div class="batch-tc-2-typ-n-pos-4-27">Batch TC 2 (Typ N) Pos 4.27</div>
    <div class="name-12"></div>
    <div class="batch-tc-3-typ-n-pos-4-28">Batch TC 3 (Typ N) Pos 4.28</div>
    <div class="name-13"></div>
    <div class="spare">Jig Height</div>
    <div class="name-14"></div>
    <div class="spare2">Ram type</div>
    <div class="name-15"></div>
    <div class="spare3">Load of checking the work height </div>
    <div class="name-16"></div>
    <div class="ams-operation">AMS operation</div>
    <div class="name-17"></div>
    <div class="gradient-of-force">Gradient of Force</div>
    <div class="comment-text"></div>
    <div class="comment">Comment</div>
    <div class="comment-1"></div>
    <div class="_20-1200">20 ... 1200</div>
    <div class="comment-2"></div>
    <div class="_0-l-1">0 l 1</div>
    <div class="comment-3"></div>
    <div class="_0-300">0 ... 300</div>
    <div class="comment-4"></div>
    <div class="_0-01-7">0.01 ... 7</div>
    <div class="comment-5"></div>
    <div class="_0-6300">0 ... 6300</div>
    <div class="comment-6"></div>
    <div class="_0-320">0 ... 360</div>
    <div class="comment-7"></div>
    <div class="_15-50">15 ... 50</div>
    <div class="comment-8"></div>
    <div class="_0-0-50-0">0.0 ... 50.0</div>
    <div class="comment-9"></div>
    <div class="_0-280">0 ... 280</div>
    <div class="comment-10"></div>
    <div class="_0-l-12">0 l 1</div>
    <div class="comment-11"></div>
    <div class="_0-l-13">0 l 1</div>
    <div class="comment-12"></div>
    <div class="_0-l-14">0 l 1</div>
    <div class="comment-13"></div>
    <div class="comment-14"></div>
    <div class="comment-15"></div>
    <div class="comment-16"></div>
    <div class="_0-l-15">0 l 1</div>
    <div class="comment-17"></div>
    <div class="_5-50">5 ... 50</div>
    <div class="value-text"></div>
    <div class="value">Value</div>
    <div class="value-1"></div>

	    <input type="text"class="input-value-1 input-text"name="DONGHWA.PLC.GLOBAL.input-value-1">

	<div class="value-2"></div>

	    <input type="text"  class="input-value-2 input-text"name="DONGHWA.PLC.GLOBAL.input-value-2">

	<div class="value-3"></div>
	
	    <input type="text"class="input-value-3 input-text"name="DONGHWA.PLC.GLOBAL.input-value-3">

	<div class="value-4"></div>

	    <input type="text" class="input-value-4 input-text"name="DONGHWA.PLC.GLOBAL.input-value-4">

	<div class="value-5"></div>

	    <input type="text"class="input-value-5 input-text"name="DONGHWA.PLC.GLOBAL.input-value-5">

	<div class="value-6"></div>

	    <input type="text"class="input-value-6 input-text"name="DONGHWA.PLC.GLOBAL.input-value-6">

	<div class="value-7"></div>

	    <input type="text"class="input-value-7 input-text"name="DONGHWA.PLC.GLOBAL.input-value-7">

	<div class="value-8"></div>

	    <input type="text"class="input-value-8 input-text"name="DONGHWA.PLC.GLOBAL.input-value-8">

	<div class="value-9"></div>

	    <input type="text" class="input-value-9 input-text"name="DONGHWA.PLC.GLOBAL.input-value-9">

	<div class="value-10"></div>

	    <input type="text"class="input-value-10 input-text"name="DONGHWA.PLC.GLOBAL.input-value-10">

	<div class="value-11"></div>

	    <input type="text" class="input-value-11 input-text"name="DONGHWA.PLC.GLOBAL.input-value-11">

	<div class="value-12"></div>

	    <input type="text"class="input-value-12 input-text"name="DONGHWA.PLC.GLOBAL.input-value-12">

	<div class="value-13"></div>

	    <input type="text"class="input-value-13 input-text"name="DONGHWA.PLC.GLOBAL.input-value-13">

	<div class="value-14"></div>

	    <input type="text" class="input-value-14 input-text"name="DONGHWA.PLC.GLOBAL.input-value-14">

	<div class="value-15"></div>
	
	    <input type="text"class="input-value-15 input-text"name="DONGHWA.PLC.GLOBAL.input-value-15">

	<div class="value-16"></div>

	    <input type="text"class="input-value-16 input-text"name="DONGHWA.PLC.GLOBAL.input-value-16">

	<div class="value-17"></div>

	    <input type="text"class="input-value-17 input-text"name="DONGHWA.PLC.GLOBAL.input-value-17">


    <div class="unit-text"></div>
    <div class="unit">Unit</div>
    <div class="unit-1"></div>
    <div class="c">°C</div>
    <div class="unit-2"></div>
    <div class="mm">mm</div>
    <div class="unit-3"></div>
    <div class="mm-s">mm/s</div>
    <div class="unit-4"></div>
    <div class="k-n">kN</div>
    <div class="unit-5"></div>
    <div class="mm2">mm</div>
    <div class="unit-6"></div>
    <div class="mm3">mm</div>
    <div class="unit-7"></div>
    <div class="mm4">mm</div>
    <div class="unit-8"></div>
    <div class="unit-9"></div>
    <div class="k-n2">kN</div>
    <div class="unit-10"></div>
    <div class="unit-11"></div>
    <div class="unit-12"></div>
    <div class="unit-13"></div>
    <div class="unit-14"></div>
    <div class="unit-15"></div>
    <div class="unit-16"></div>
    <div class="unit-17"></div>
    <div class="k-n-s">kN / s</div>
    <div class="edit-global-data">Edit global data</div>
  <!--  <div class="save"></div>
    <div class="save2">Save</div>-->
    <div class="back">Back</div>
    <div class="save-to-plc">save</div>

  </div>
<script>
document.addEventListener("DOMContentLoaded", function() {
    document.querySelector('.back').addEventListener('click', function() {
        window.history.back();
    });

    overviewListView();
});

// OPC값 알람 조회
function overviewListView() {
    $.ajax({
        url: "/donghwa/furnace/global/view",
        type: "post",
        dataType: "json",
        success: function(result) {
            var data = result.multiValues;

            for (let key in data) {
                for (let keys in data[key]) {
                    var d = data[key];

                    if (d[keys].action == "v") {
                        v(keys, d[keys].value);
                    } else if (d[keys].action == "c") {
                        c(keys, d[keys].value);
                    } else if (d[keys].action == "b") {
                        b(keys, d[keys].value);
                    } else if (d[keys].action == "value") {
                        value(keys, d[keys].value);
                    }
                }
            }
        }
    });
}

function v(keys, value) {
    if (value == true) {
        $("." + keys).css({
            "background-color": "green",
            "color": "white"
        });
    } else {
        $("." + keys).css({
            "background-color": "#A9A9A9",
            "color": "black"
        });
    }

    $("." + keys).attr("onclick", "digitalSet('DONGHWA.PLC.GLOBAL','" + keys + "')");
    $("." + keys).css("cursor", "pointer");
}

function value(keys, value) {

    if (keys === "input-value-4") {
        value = (parseFloat(value) * 0.01).toFixed(2); 
    }

    $("." + keys).val(value);
    $("." + keys).css({
        "background-color": "white",
        "text-align": "center",
        "font-size": "19pt",
        "cursor": "pointer"
    });
}


$(document).on("click", ".save-to-plc", function () {
    console.log("Save to PLC 버튼 클릭됨");

    let data = [];

    $('.input-text').each(function() {
        const inputField = $(this);
        let value = inputField.val();
        const nodeId = inputField.attr('name');

        // "input-value-4"만 100을 곱해서 변환
        if (nodeId === "DONGHWA.PLC.GLOBAL.input-value-4") {
            value = (parseFloat(value) * 100).toFixed(0); // 정수형 변환
        }

        data.push({
            nodeId: nodeId,
            value: value
        });
    });

    console.log("📌 [DEBUG] 전송 데이터:", JSON.stringify(data));

    // AJAX 요청 (서버로 데이터 전송)
    $.ajax({
        url: "/donghwa/furnace/recipe/plcWrite",
        type: "POST",
        data: JSON.stringify(data),
        contentType: "application/json",
        success: function(response) {
            console.log("데이터 저장 성공:", response);
            alert("데이터가 성공적으로 저장되었습니다");
            overviewListView();
        },
        error: function(xhr, status, error) {
            console.error("데이터 저장 실패:", error);
            alert("저장 중 오류 발생: " + error);
        }
    });
});
document.addEventListener("DOMContentLoaded", () => {
    const menu = document.getElementById('hamburgerMenu');


    // 0.3초 후에 메뉴를 닫기
    setTimeout(() => {
        menu.classList.remove('active');
    }, 300); // 300ms (0.3초) 후에 메뉴 닫기
});
</script>
</body>
</html>