<%@ page session="true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Setting </title>
    <%@ include file="../include/mainHeader.jsp" %>
    <jsp:include page="../include/pluginpage.jsp"/>
       <jsp:include page="../include/commonPopup.jsp"/>
   
 <style>
body {
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #f0f0f0;
    min-height: 100vh;
    flex-direction: column;
    margin-top: 20px;
}

    .container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        gap: 110px;
   		 width: 1640px;
        margin-left: 250px;
    }

    .panel {
        background: white;
        border-radius: 10px;
        box-shadow: 3px 3px 12px rgba(0, 0, 0, 0.2);
        width: 400px;
        padding: 20px;
        text-align: center;
    }

    .panel-title {
        background: #2a5daa;
        color: white;
        padding: 12px;
        font-weight: bold;
        font-size: 22px;
        border-radius: 5px 5px 0 0;
    }

    .panel-content {
        padding: 15px;
    }

   .sub-title {
	    background: #7a9bc3;
	    color: white;
	    font-weight: bold;
	    padding: 6px;
	    border-radius: 5px;
	    margin-bottom: 10px;
	    height: 30px;
	    font-size: 20px;
	}

    .table {
        width: 100%;
        border-collapse: collapse;
        font-size: 20px;
    }

    .table td {
    border-bottom: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}

    .table td:last-child {
        text-align: right;
    }

    .btn-group {
        display: flex;
        flex-direction: column;
        gap: 10px;
        margin-top: 10px;
    }

    .btn {
        padding: 12px;
        border-radius: 8px;
        font-weight: bold;
        cursor: pointer;
        border: none;
        font-size: 20px;
        transition: 0.3s ease;
    }

    .btn-green {
        background: #28a745;
        color: white;
    }

    .btn-green:hover {
        background: #218838;
    }

    .btn-orange {
        background: #fd7e14;
        color: white;
    }

    .btn-orange:hover {
        background: #e96900;
    }

    .input-group {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }

    .input-group input {
        width: 100%;
        padding: 8px;
        text-align: center;
        font-size: 20px;
    }

    
	.R1000V, .R1002, .R1005V, .R1007, 
	.R1010V, .R1012, .R1050V, .R1052, 
	.R1055V, .R1057, .R1100, .R1105, .R1015, .R1017, .R1060, .R1062 {
	    position: absolute;
	}

	
	.E1, .E2, .E3, .E4, .E5,.E6,.E7 {
	    position: absolute;
	    font-size: 20px;
	}
	.E1 { bottom: 778px; right: 1497px; }
	.E3 { bottom: 733px; right: 1497px; }
	.E5 { bottom: 688px; right: 1497px; }
	.E6 { bottom: 645px; right: 1497px; }
	
	.E2 { bottom: 322px; right: 1497px; }
	.E4 { bottom: 277px; right: 1497px; }	
	.E7 { bottom: 232px; right: 1497px; }
	
	


	
	
	
	

	.R1000V { bottom: 775px; right: 1600px; }
	.R1002  { bottom: 775px; right: 1533px; }
	
	.R1005V { bottom: 730px; right: 1600px; }
	.R1007  { bottom: 730px; right: 1533px; }
	
	.R1010V { bottom: 685px; right: 1600px; }
	.R1012  { bottom: 685px; right: 1533px; }
	
	.R1015V { bottom: 643px; right: 1600px; }
	.R1017  { bottom: 643px; right: 1533px; }
	
	.R1050V { bottom: 320px; right: 1600px; }
	.R1052  { bottom: 320px; right: 1533px; }
	
	.R1055V { bottom: 275px; right: 1600px; }
	.R1057  { bottom: 275px; right: 1533px; }
	
	.R1060V { bottom: 230px; right: 1600px; }
	.R1062  { bottom: 230px; right: 1533px; }
	
	.R1100 { bottom: 830px; right: 340px; }
	.R1105 { bottom: 785px; right: 340px; }
	    
</style>

</head>

<body>

    <div class="container">
        <!-- 첫 번째 줄 (3개) -->
        <div class="panel">
            <div class="panel-title">High Vacuum Pressure Set </div>
            <div class="panel-content">
                <div class="sub-title">Diffusion Pump Vacuum</div>
                <table class="table">
                    <tr><td>Booster Set</td><td class="R1000V0"></td></tr>
                    <tr><td>Diffusion Set</td><td class="R1005V0"></td></tr>
                    <tr><td>Complete Set</td><td class="R1010V0"></td></tr>
                    <tr><td>Abnormal Set</td><td class="R1010V0"></td></tr>
                </table>
            </div>
        </div>

        <div class="panel">
            <div class="panel-title">Step Reset</div>
            <div class="panel-content btn-group">
                <button class="btn btn-green Puping-Station">Puping Station Reset</button>
                <button class="btn btn-green High-Vacuum-Pump ">High Vacuum Pump Reset</button>
                <button class="btn btn-green Evacuate-Fine-Vacuum">Evacuate Fine Vacuum Reset</button>
                <button class="btn btn-green Evacuate-High-Vacuum ">Evacuate High Vacuum Reset</button>
            </div>
        </div>

        <div class="panel">
            <div class="panel-title">Temp Out Limit</div>
            <div class="panel-content">
            
                <table class="table">
                    <tr><td>0 ~ 200 °C</td><td ></td></tr>
                    <tr><td>200°C Over</td><td ></td></tr>
                </table>
            </div>
        </div>

        <!-- 두 번째 줄 (2개) -->
        <div class="panel">
            <div class="panel-title">Evacuate High Pressure Set</div>
            <div class="panel-content">
                <div class="sub-title">Furnace Vacuum </div>
                <table class="table">
                    <tr><td>Booster Set</td><td></td></tr>
                    <tr><td>High Set</td><td></td></tr>
                    <tr><td>Abnormal Set</td><td></td></tr>
                </table>
            </div>
        </div>

        <div class="panel">
            <div class="panel-title">Etc</div>
            <div class="panel-content btn-group">
                <button class="btn btn-orange MANUAL-LEAK-TEST">MANUAL LEAK TEST SKIP</button>
            </div>
        </div>
        
        
        
        <div class="panel">
            <div class="panel-title">EX</div>
            <div class="panel-content btn-group">
        
            </div>
        </div>
        

    </div>

			<div class="E1">E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Torr</div>
			<div class="E2">E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Torr</div>
			<div class="E3">E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Torr</div>
			<div class="E4">E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Torr</div>
			<div class="E5">E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Torr</div>
			
			<div class="E6">E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Torr</div>
			<div class="E7">E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Torr</div>
	
		    <div class="R1000V"></div>
		    <div class="R1002"></div>
		   
		    <div class="R1005V"></div>
		    <div class="R1007"></div>
		    
		    <div class="R1010V"></div>
		    <div class="R1012"></div>
		   
		   		    
		    <div class="R1015V" style="position: absolute;"></div>
		    <div class="R1017" style="position: absolute;"></div>
		    
		   
		    <div class="R1050V"></div>
		    <div class="R1052"></div>
		    
		    <div class="R1055V"></div>
		    <div class="R1057"></div>
		    
		    
		    
		    
		    <div class="R1100" ></div>
		    <div class="R1105"></div>
		    

		    
			<div class="R1060V" style="position: absolute;"></div>
			<div class="R1062" style="position: absolute;"></div>

		    
		    
		    
	




  <script>


    var overviewInterval;

    //로드
    $(function(){
    	overviewListView();
    	overviewInterval = setInterval("overviewListView()", 1500);
    });

  //OPC값 알람 조회
   function overviewListView() {
    $.ajax({
        url: "/donghwa/parameter/admin/view",
        type: "post",
        dataType: "json",
        success: function (result) {
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


   function v(keys, value) {
	    if (value == true) {
	        $("." + keys).css("background-color", "red");
	        $("." + keys).css("color", "white");
	    } else {
	        $("." + keys).css("background-color", "");
	    }
        $("."+keys).attr("onclick","digitalSet('DONGHWA.PARAMETER.ADMIN','"+keys+"')");
        
	                    
	    }
	    
	



   function value(keys, value) {
	    if (!$("div").hasClass("anlog-popup-div-color")) {
	        // 특정 키면서 값이 0 이상이면 + 기호 추가
	        if (["R1007", "R1002", "R1012", "R1052", "R1057"].includes(keys) && value >= 0) {
	            value = "+" + value;
	        }
	        // 특정 키면 뒤에 "°C" 추가
	     if (["R1100", "R1105"].includes(keys)) {
		    value = (value / 10).toFixed(1) + "%";
		}


	        $("." + keys).text(value);
	    }

	    $("." + keys).css({
	        "display": "",
	        "text-align": "center",
	        "font-size": "19pt",
	        "cursor": "pointer"
	    });

	    $("." + keys).attr({
	        "ondblclick": "popupOpenAna('" + keys + "','DONGHWA.PARAMETER.ADMIN')",
	        "align-items": "center"
	    });
	}


  var popup;
  
  function modalClick(location){
      const modal = document.querySelector('.'+location);
      modal.style.display="";
  }
  
  
  

     




  </script>
</body>



</html>