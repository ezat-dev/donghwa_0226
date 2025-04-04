<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Recipe</title>
<jsp:include page="../include/pluginpage.jsp"/>
</head>
<style>

.button-container {
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
    cursor:pointer;
}

.button-container > label{
    font-size: 14pt;
    width: 50px;
    text-align: center;
    font-weight:700;
}

.button-container select{
    width: 140px;
    height: 35px;
    border: 1px solid black;
    border-radius: 6px 6px 6px 6px;
    margin-left: 1%;
    font-size:14pt;
    font-weight:700;
    text-align:center;
}

</style>


<body>

	<form action="" autocomplete="off">
	    <div class="button-container">
	        <input type="text" id="startDate" readonly="readonly">
	        <label for="">~</label>
	        <input type="text" id="endDate" readonly="readonly">
            <select id="pen-group"></select>
	        
	        <button id="searchBtn" type="button"><i class="fas fa-search"></i> SEARCH</button>        
	    </div>
	</form>

<div id="container" style="width:1900px; height:900px; margin-top:50px;"></div>

<script>
//전역변수
var batchReportIdx;
var batchReportStime;
var batchReportEtime;

var bcf1;		//1호기 차트변수
var bcf1Data;	//1호기 차트데이터

var timeInterval;
var bcf1_inteval;

var segmentJson, timeJson, temperJson, temperToleranceContJson, temperToleranceHoldJson;
var holdbackTimeoutHeatingJson, pressureSetValueJson;
var pressingCapacityF1Json, pressingCapacityF2Json;
var foreceToleranceJson, positionAbsJson;
var positionRelativeJson, distanceToleranceJson;
var holdingTime1Json, holdingTime2Json;
var numberOfLoopsJson, speedOfPlungerJson, gradientOfForceJson;

var seriesArray = [];

//로드
$(function(){
	batchReportIdx = sessionStorage.getItem("batchReportIdx");
	batchReportStime = sessionStorage.getItem("batchReportStime");
	batchReportEtime = sessionStorage.getItem("batchReportEtime");
	
	console.log(batchReportStime, batchReportEtime);
	
	$("#startDate").val(batchReportStime);
	$("#endDate").val(batchReportEtime);
	
	getPenGroupSelect();
	
    getPenGroupChartData();    
    setTimeout(function () {
//        $("#load-pen-group").click(); // 버튼 클릭 이벤트 트리거
    	getPenGroupChart();
    }, 500); // 0.5초 후 실행 

	
	
});
//이벤트
$("#searchBtn").on("click",function(){
	getPenGroupChartData();
});
//함수
function getPenGroupSelect(){
    $.ajax({
        url: "/donghwa/analysis/historyTrendPenGroupSelect",
        method: "POST",
        data: {},
        dataType: "json",
        success: function(data) {
        	var result = data.result;
        	
        	var option = "";
        
        	var penName = "";
        	
        	for(var i=0; i<result.length; i++){
        		option = "<option value='"+result[i]+"'>"+result[i]+"</option>";
        		$("#pen-group").append(option);
        	}
        }
    });
}


function getPenGroupChartData() {
    var sdate = $("#startDate").val() + ":00";
    var edate = $("#endDate").val() + ":59";
    var selectedGroup = $("#pen-group").val();

    // selectedGroup이 null인 경우 '그룹1'로 설정
    if (!selectedGroup) {
        selectedGroup = 'Group1';
    }

    $.ajax({
        url: "/donghwa/analysis/historyTrendPenGroupChart",
        type: "post",
        dataType: "json",
        data: {
            "sdateTime": sdate,
            "edateTime": edate,
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

const categories = [
    '1e+8', '1e+6', '10000', '100', '1', '0.01', '0.001', '1e-8', '1e-10'
];
const formattedCategories = categories.map(item => parseFloat(item));

function getPenGroupChart(){
    const chart = Highcharts.chart('container', {
        chart: {

            type: "spline",
            panning: true,
            panKey: "shift",
            zoomType: "x",
            styleMode: true,
            height:800,  // 차트 높이 설정
            width: 1890   // 차트 너비 설정
        },
        time: {
            timezone: "Asia/Seoul",
            useUTC: false
        },
        yAxis: [
            {
                min:0,
                max:600,
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
                min:-100,
                max:500,
                crosshair: {
                    width: 3,
                    color: '#5D5D5D',
                    zIndex: 5
                },
                title: {
                    text: 'Press[kN]'
                },
                labels: {
                	format: '{value} K' ,
                    style: {
                        fontSize: "14pt"
                    }
                }
            },
            {
                min:-100,
                max:25000,
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
            },
            {
            	min: 0,
            	max: 10,
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
        series: seriesArray,
        responsive: {
            rules: [{
                condition: {
                    maxWidth: 1500
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
        tooltip: {
            useHTML: true,
            shared: true, // 여러 시리즈의 데이터를 보여줌
            positioner: function(labelWidth, labelHeight, point) {
            		//maxWidth : 1500으로 설정되어 있음.
            		var xValue = 0;
        			var yValue = 0;
            		if((1500-200) < (point.plotX + this.chart.plotLeft + 15)){
            			xValue = (1500-200);
            		}else{
            			xValue = (point.plotX + this.chart.plotLeft + 15);
            		}
            		var obj = {"x":point.plotX, "plotX":this.chart.plotLeft, 
            					"y":point.plotY, "plotY":this.chart.plotTop};
            		
              return { x: 900, y: 60 }; // 툴팁 위치 조정
            },
            formatter: function() {
          	  $("#value0_v").text(Highcharts.dateFormat('%m-%d %H:%M',this.x));
              var s = '<b style="font-size:14pt;">' + Highcharts.dateFormat('%H:%M:%S', this.x) + '</b><br/>'; // 시간 표시
              this.points.forEach(function(point) {
              	var point_y = point.y;
              	var point_name = point.series.name;
              	if(point_name.indexOf("CP") != -1){
              		point_y = (point.y).toFixed(3);
              	}
              	
              	$("#value"+(point.series.index+1)+"_h").css("color",point.series.color);
              	$("#value"+(point.series.index+1)+"_v").text(point_y);
              	//color:' + point.series.color + '
              	
                s += '<span style="font-weight:bold; font-size:14pt; ">' + point.series.name + ':</span> <span style="font-size:14pt;">' + point_y + '</span><br/>'; // 각 시리즈의 데이터 표시
              });
              return s;
            },
            borderColor: '#333333',
            shadow: false
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


function unix_timestamp(t) {
//	console.log(t);	

    var date = new Date(t*1000);
    var year = date.getFullYear();

    var month = paddingZero(date.getMonth()+1);
    var day = paddingZero(date.getDate());
    var hour = paddingZero(date.getHours());
    var minute = paddingZero(date.getMinutes());
    
    return month.substr(-2) + "-" + day.substr(-2) + "<br/> " + hour.substr(-2) + ":" + minute.substr(-2);
}

function cursorSetDateTime(t) {
//	console.log(t);	

    var date = new Date(t*1000);
    var year = date.getFullYear();

    var month = paddingZero(date.getMonth()+1);
    var day = paddingZero(date.getDate());
    var hour = paddingZero(date.getHours());
    var minute = paddingZero(date.getMinutes());
    
    return year+"-"+month.substr(-2) + "-" + day.substr(-2) + " " + hour.substr(-2) + ":" + minute.substr(-2);
}


</script>
</body>

</html>