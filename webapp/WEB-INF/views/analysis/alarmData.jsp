<%@ page session="true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../include/pluginpage.jsp"/>

<head>
    <meta charset="UTF-8">
    <title>ALARM DATA</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }

        .popup-container {
            width: 800px;
            height: 700px;
            margin: 50px auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
            overflow: hidden;
        }

        .popup-title {
            height: 100px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }
        .tabulator{
            font-size: 18px;
        }

        #tabulator-table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        #tabulator-table th, #tabulator-table td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        #tabulator-table th {
            background-color: #007bff;
            color: white;
        }

        .countDATA {
            text-align: center;
            font-size: 16px;
            margin-top: 20px;
            color: #333;
        }

        .loading-message, .error-message {
            text-align: center;
            color: #ff0000;
            font-size: 18px;
            font-weight: bold;
            display: none;
        }

        .footer .buttons {
            gap: 10px;
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
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .button img {
            width: 50px;
            height: 50px;
        }

        .button:hover {
            background-color: #4a5d6a; 
            transform: scale(1.1);
        }

        .bt_reset{
            position: absolute;
            left: 740px;
            bottom: 720px;
        }

    </style>
</head>
<body>

    <div class="popup-container">
        <div class="popup-title">
            실시간 알람 데이터
        </div>
        <div class="button bt_reset M-8035"><img src="/donghwa/css/furnace/img/reset3.png" alt="alarm"></div>
        <div class="loading-message">데이터를 로딩 중입니다...</div>
        <div id="tabulator-table"></div>
        <div class="countDATA">조회된 데이터 수 : 0</div>
    </div>

    <script>
    $(document).ready(function () {
        function fetchAlarmData() {
            $.ajax({
                url: "/donghwa/analysis/alarmData",
                method: "POST",
                dataType: "json",
                success: function(data) {
                    table.setData(data);
                    document.querySelector(".countDATA").textContent = "조회된 데이터 수 : " + data.length;
                    
                },
                error: function() {
                    console.error("데이터를 가져오는 데 실패했습니다.");
                }
            });
        }

        fetchAlarmData();

        setInterval(fetchAlarmData, 3000);

        $(".M-8035").click(function () {
            $.ajax({
                url: "/donghwa/common/valueDigitalSet",
                type: "POST",
                dataType: "json",
                data: {
                    "sendTagDir": "DONGHWA.OVERVIEW", 
                    "sendTagName": "M-8035",
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
    });

    var tableData = []; 

    var table = new Tabulator("#tabulator-table", {
        height: 600,
        data: tableData, 
        layout:"fitColumns",
        selectable:true,
        tooltips:true,
        selectableRangeMode:"click",
        reactiveData:true,
    
        headerHozAlign:"center",
        columns: [
            { title: "ALARMDESC", field: "alarmDesc", width: 470, hozAlign:"center"},
            { title: "START TIME", field: "time", width: 330, hozAlign:"center"},
        ],
        placeholder: "검색 결과가 없습니다.", 
    });

    function overviewListView(){
        $.ajax({
            url:"/donghwa/furnace/overview/view",
            type:"post",
            dataType:"json",
            success:function(result){                
                var data = result.multiValues;
                
                for(let key in data){
                    for(let keys in data[key]){
                        var d = data[key];

                        if(d[keys].action == "v"){
                            v(keys, d[keys].value);
                        }else if(d[keys].action == "c"){
                            c(keys, d[keys].value);
                        }else if(d[keys].action == "b"){
                            b(keys, d[keys].value);
                        }else if(d[keys].action == "value"){
                            value(keys, d[keys].value);
                        }
                    }                    
                }
            }
        });
    }

    function v(keys, value){
        $("." + keys).attr("onclick", "digitalSet('DONGHWA.OVERVIEW', '" + keys + "')")
                     .css("cursor", "pointer"); 
    }
    </script>

</body>
</html>
