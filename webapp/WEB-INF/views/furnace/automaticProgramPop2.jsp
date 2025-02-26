<%@ page session="true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./vars.css">
<link rel="stylesheet" href="/donghwa/css/furnace/automaticProgramPop2.css">
<jsp:include page="../include/pluginpage.jsp"/>
   <jsp:include page="../include/commonPopupMain.jsp"/>
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
	  width: 50px;
	  height: 50px;
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

	

   </style>
  <title>Document</title>
</head>
<body>
 
    <div class="auto-pro-box"></div>
    <div class="auto-pro-header"></div>
    <div class="auto-pro-main"></div>
    <div class="automatic-program">Automatic program</div>
    
    <div class="automatic"></div>
    <div class="automatic-text" onclick="popupClick('/donghwa/furnace/automaticProgramPop4', 508, 392, 730, 235);">Automatic</div>
    <div class="programmer"></div>
    <div class="programmer-text" onclick="popupClick('/donghwa/furnace/automaticProgramPop2', 508, 392, 730, 235);">Programmer</div>
    <div class="start-conditions"></div>
    <div class="startconditions-text" onclick="popupClick('/donghwa/furnace/automaticProgramPop3', 508, 392, 730, 235);">Startconditions</div>
    <div class="batch-data"></div>
    <div class="batch-data-text" onclick="popupClick('/donghwa/furnace/automaticProgramPop1', 508, 392, 730, 235);">Batch data</div>
    <div class="jump"></div>
    
    <div class="button-container">
	   <div class="button start_bt" onclick="startProgram()">
		    <img src="/donghwa/css/furnace/img/start3.png" alt="Start">
		</div>
		<div class="button pause_bt" onclick="pauseProgram()">
		    <img src="/donghwa/css/furnace/img/pause3.png" alt="Pause">
		</div>
		<div class="button stop_bt" onclick="stopProgram()">
		    <img src="/donghwa/css/furnace/img/stop3.png" alt="Stop">
		</div>

 	 </div>
    
    
    <div class="jump2">Jump</div>
 
    <div>
     <div class="jump-val"></div>
    </div>




    <div class="setpoint"></div>
    <div class="use-actual-value-as-setpoint">Use actual value as setpoint</div>
    <div class="ram-sav"></div>
    <div class="ramprate-sav">Ramprate SAV</div>
    <div class="ram-sav-val"></div>
    <div class="end-sav"></div>
    <div class="end-setpoint-sav">End setpoint SAV</div>
    <div class="end-sav-val"></div>
    <div class="pro-step"></div>
    <div class="programmed-procedure-step">Programmed procedure step</div>
    <div class="heating-vacuum"></div>
    <div class="heating-vacuum2">Heating Vacuum</div>

     <script>


    var overviewInterval;

    //로드
    $(function(){
    	overviewListView();
    	overviewInterval = setInterval("overviewListView()", 500);
    });

  //OPC값 알람 조회
    function overviewListView(){
    	$.ajax({
    		url:"/donghwa/furnace/automaticProgramPop2/view",
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
//    	console.log(keys);
//    	console.log(value);
    	if(value == true){
    		$("."+keys).css("background-color","green");
    		$("."+keys).css("color","white");
    	}else{
    		$("."+keys).css("background-color","#A9A9A9");
    		$("."+keys).css("color","black");
    	}

    	$("."+keys).attr("onclick","digitalSet('DONGHWA.FURNACE.AUTOMATIC_PROGRAM.PROGRAMMER','"+keys+"')");
    	$("."+keys).css("cursor","pointer");
    }


    function value(keys, value){
    	if(!$("div").hasClass("anlog-popup-div-color")){
    		$("."+keys).text(value);	
    	}
    	
    	$("."+keys).css("display","");
    	$("."+keys).css("text-align","center");
    //	$("."+keys).css("font-weight","700");
    	$("."+keys).css("font-size","15pt");
    	$("."+keys).css("padding-top","5px");
    	$("."+keys).attr("ondblclick","popupOpenAna('"+keys+"','DONGHWA.FURNACE.AUTOMATIC_PROGRAM.PROGRAMMER')");
    	$("."+keys).css("cursor","pointer");
    	$("."+keys).attr("align-items","center");
    	$("."+keys).attr("margin-botoom","7px");

    }

    
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



 



  </script>
</body>
</html>