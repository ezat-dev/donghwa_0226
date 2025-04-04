<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <%@ include file="../include/mainHeader.jsp" %>
  <title>Recipe</title>
<jsp:include page="../include/pluginpage.jsp"/>

</head>
<style>

.button-container {
	position:absolute;
	top:60px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
	margin-right:350px;
}

.button-container > input{
	border: 1px solid black;
	border-radius: 6px 6px 6px 6px;
    width: 200px;
    height: 30px;
    font-size: 14pt;
    font-weight: 700;
    margin-left:2%;
    text-align:center;
}

.button-container > button{
	width: 180px;
    height: 34px;
    border: 1px solid black;
    border-radius: 6px 6px 6px 6px;
    background-color: white;
    font-size: 14pt;
    margin-left: 2%;
}

.row_select{
	background-color:#9ABCEA !important;
}   
   </style>
   
   
   
  <title>Document</title>
</head>
<body style="background-color: #CCCCCC;">
	<form action="" autocomplete="off">
	    <div class="button-container">
	        <input type="text" id="startDate" class="dateSet ">
	        <input type="text" id="endDate" class="dateSet">
	        <button id="searchBtn" type="button"><i class="fas fa-search"></i> SEARCH</button>        
	    </div>
	</form>
	
	<div id="recipe_list" class="frame-1" style="position:absolute; top:140px; height:85%; width:100%;"></div>
<script>
//전역변수
var batchTable;
var selectIdx = 0;
var selectDataIdx = 0;
var selectNumber = 0;
var selectName = "";
var selectComment = "";


document.addEventListener("DOMContentLoaded", () => {
    const menu = document.getElementById('hamburgerMenu');


    // 0.3초 후에 메뉴를 닫기
    setTimeout(() => {
        menu.classList.remove('active');
    }, 300); // 300ms (0.3초) 후에 메뉴 닫기
});
//로드
$(function(){
    var today = new Date();
    
    //검색 시작일자
    var bYear = today.getFullYear();
    var bMonth = paddingZero(today.getMonth()+1);
    var bDate = paddingZero(today.getDate()-1);
    
    //검색 종료일자
    var aYear = today.getFullYear();
    var aMonth = paddingZero(today.getMonth()+1);
    var aDate = paddingZero(today.getDate());
    
    
    $("#startDate").val(bYear+"-"+bMonth+"-"+bDate);
    $("#endDate").val(aYear+"-"+aMonth+"-"+aDate);	
	
    getBatchList();
})
//이벤트
$("#searchBtn").on("click",function(){
	getBatchList();
});
//함수


	function getBatchList(){
		
		batchTable = new Tabulator("#recipe_list",{
		    //height:"1000px",
		    layout:"fitColumns",
		    selectable:true,	//로우 선택설정
		    headerVisible:true,
		    headerHozAlign:"center",
		    ajaxConfig:"POST",
			ajaxProgressiveLoad:"scroll",
		    ajaxURL:"/donghwa/analysis/batchReport/list",			    			    			    
		    ajaxParams:{
		    	"sdate":$("#startDate").val(),
		    	"edate":$("#endDate").val()
		    },
		    placeholder:"데이터를 불러오는중입니다.....",
		    paginationSize:20,
			columns:[
				{title:"No", field:"idx", sorter:"int", width:100,
					hozAlign:"center"},
				{title:"RecipeNumber", field:"recipe_number", sorter:"int", width:150,
					hozAlign:"center"},
				{title:"RecipeName", field:"recipe_name", sorter:"string", width:300,
					hozAlign:"center"},
				{title:"RecipeComment", field:"recipe_comment", sorter:"string", width:400,
					hozAlign:"center"},
				{title:"RecipeStart", field:"recipe_stime", sorter:"string", width:220,
					hozAlign:"center"},
				{title:"RecipeEnd", field:"recipe_etime", sorter:"string", width:220,
					hozAlign:"center"}
			],
		    rowFormatter:function(row){
		    	row.getElement().style.backgroundColor = "#FFFFFF";
		    	row.getElement().style.fontSize = "14pt";
		    	row.getElement().style.fontWeight = "700";
			},
			rowClick:function(e, row){
	
				$(".tabulator-table > .tabulator-row").each(function(index, item){
					
					if($(this).hasClass("row_select")){							
						$(this).removeClass('row_select');
						row.getElement().className += " row_select";
					}else{
						$("div.row_select").removeClass("row_select");
						row.getElement().className += " row_select";	
					}
				});
				
			},				
		    rowDblClick:function(e, row){
			    var data = row.getData();
			    
			    //트렌드 창
			    var idx = data.idx;
			    var stime = data.recipe_stime;
			    var etime = data.recipe_etime;
			    
			    console.log(stime, etime);
			    
			    if(stime != null && etime != null){
			    	//트렌드 창
			    	batchReportTrend(idx,stime,etime);
			    }else{
			    	alert("레시피 종료 후 확인 가능합니다.");
			    }
			    
			}
			
		});	
	}

function batchReportTrend(rowIdx, rowStime, rowEtime){
	sessionStorage.setItem("batchReportIdx", rowIdx);
	sessionStorage.setItem("batchReportStime", rowStime);
	sessionStorage.setItem("batchReportEtime", rowEtime);
	
	var url = "/donghwa/analysis/batchReport/trend";
	
	window.open(url,"test", "scrollbars=no,width=1600,height=900,top=200,left=100,menubar=false");	
}

//다이얼로그
</script>
</body>
</html>