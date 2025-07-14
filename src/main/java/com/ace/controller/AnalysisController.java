package com.ace.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import org.eclipse.milo.opcua.stack.core.UaException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.domain.Alarm;
import com.ace.domain.BatchReport;
import com.ace.domain.Temper;
import com.ace.service.AnalysisService;
import com.ace.util.OpcDataMap;

@Controller
public class AnalysisController {

	@Autowired
	private AnalysisService analysisService;
	
	private static List<Temper> penListStatic = new ArrayList<Temper>();
	
	
	//히스토리트렌드(테스트용)
	@RequestMapping(value = "/analysis/historyTrend", method = RequestMethod.GET)
	public String historyTrend(Model model) {
		return "/analysis/historyTrend.jsp";
	}
	
	//히스토리트렌드 펜그룹 설정
	@RequestMapping(value = "/analysis/historyTrendPenGroup", method = RequestMethod.GET)
	public String historyTrendPenGroup(Model model) {
		return "/analysis/historyTrendPenGroup.jsp";
	}
	
	//배치리포트
	@RequestMapping(value = "/analysis/batchReport", method = RequestMethod.GET)
	public String batchReport(Model model) {
		return "/analysis/batchReport.jsp";
	}
	
	//알람히스토리
	@RequestMapping(value = "/analysis/alarmHistory", method = RequestMethod.GET)
	public String alarmHistory(Model model) {
		return "/analysis/alarmHistory.jsp";
	}
	
	//알람데이타
	@RequestMapping(value = "/analysis/alarmData", method = RequestMethod.GET)
	public String alarmData(Model model) {
		return "/analysis/alarmData.jsp";
	}
	
	
	
	
	@RequestMapping(value = "/analysis/alarmHistory/alarmlist", method = RequestMethod.POST)
	@ResponseBody
	public List<Alarm> alarmlist(@RequestParam String sdate,
	                              @RequestParam String edate) {
	    
	    String startDateTime = sdate + " 00:00:00";
	    String endDateTime = edate + " 23:59:59";
	    
	    Alarm alarm = new Alarm();
	    alarm.setSdate(startDateTime);
	    alarm.setEdate(endDateTime);

	    return analysisService.alarmlist(alarm);
	}

	
	@RequestMapping(value = "/analysis/alarmHistory/alarmlistOverivew", method = RequestMethod.POST)
	@ResponseBody
	public List<Alarm> alarmlist() {
	    return analysisService.alarmlistOverview(); 
	}

	
	@RequestMapping(value = "/analysis/alarmData", method = RequestMethod.POST)
	@ResponseBody
	public List<Alarm> alarmData() {
	    return analysisService.alarmData(); 
	}

	//펜그룹의 태그목록 조회
	@RequestMapping(value = "/analysis/historyTrendPenGroupSelect", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> historyTrendPenGroupSelect(Model model){
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		
		List<String> penList = analysisService.historyTrendPenGroupSelect();
		
		rtnMap.put("result", penList);
		
		return rtnMap;
	}	
	
	//펜그룹의 태그목록 조회
	//리스트에 표현
	@RequestMapping(value = "/analysis/historyTrendPenGroupList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> historyTrendPenGroupList(Model model,
			@RequestParam(required = false) String pen_group_name){
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		Temper temper = new Temper();
		temper.setPen_group_name(pen_group_name);
		
		List<Temper> penList = analysisService.historyTrendPenGroupList(temper);
		penListStatic = penList;
		
		rtnMap.put("result", penList);
		
		return rtnMap;
	}
	
	
	
	
	//차트데이터 조회
	@RequestMapping(value = "/analysis/historyTrendPenGroupChart", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> historyTrendPenGroupChart(Model model,
			@RequestParam(required = false) String pen_group_name,
			@RequestParam(required = false) String sdateTime,
			@RequestParam(required = false) String edateTime){
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		Temper temper = new Temper();
		temper.setSdateTime(sdateTime);
		temper.setEdateTime(edateTime);
		temper.setPen_group_name(pen_group_name);

		
		String penGroupNameConcat = historyTrendPenGroupChartGroupName(pen_group_name);
		
		List<Temper> penList = analysisService.historyTrendPenGroupChart(temper);
		
		List<Object> tdateList = new ArrayList<Object>();
		
		List<Object> c1List = new ArrayList<Object>();
		List<Object> c2List = new ArrayList<Object>();
		List<Object> c3List = new ArrayList<Object>();
		List<Object> c4List = new ArrayList<Object>();
		List<Object> c5List = new ArrayList<Object>();
		List<Object> c6List = new ArrayList<Object>();
		List<Object> c7List = new ArrayList<Object>();
		List<Object> c72List = new ArrayList<Object>();
		List<Object> c8List = new ArrayList<Object>();
		List<Object> c9List = new ArrayList<Object>();
		List<Object> c10List = new ArrayList<Object>();
		List<Object> c11List = new ArrayList<Object>();
		List<Object> c12List = new ArrayList<Object>();
		List<Object> c13List = new ArrayList<Object>();
		List<Object> c14List = new ArrayList<Object>();
		List<Object> c15List = new ArrayList<Object>();
		List<Object> c16List = new ArrayList<Object>();
		List<Object> c17List = new ArrayList<Object>();
		List<Object> c18List = new ArrayList<Object>();
		List<Object> c19List = new ArrayList<Object>();
		List<Object> c20List = new ArrayList<Object>();
		List<Object> c21List = new ArrayList<Object>();
		List<Object> c22List = new ArrayList<Object>();
		List<Object> cs1List = new ArrayList<Object>();
		List<Object> cs2List = new ArrayList<Object>();
		List<Object> cs3List = new ArrayList<Object>();
		List<Object> cs4List = new ArrayList<Object>();
		List<Object> cs5List = new ArrayList<Object>();
		List<Object> cs6List = new ArrayList<Object>();
		List<Object> cs7List = new ArrayList<Object>();
		List<Object> cs8List = new ArrayList<Object>();
		List<Object> cs9List = new ArrayList<Object>();
		List<Object> cs10List = new ArrayList<Object>();
		List<Object> cs11List = new ArrayList<Object>();
		List<Object> cs12List = new ArrayList<Object>();
		List<Object> cs13List = new ArrayList<Object>();
		List<Object> cs14List = new ArrayList<Object>();
		List<Object> cs15List = new ArrayList<Object>();
		List<Object> cs16List = new ArrayList<Object>();
		
		List<Object> pr1List = new ArrayList<Object>();
		List<Object> pr2List = new ArrayList<Object>();
		
		List<Object> stList = new ArrayList<Object>();
		List<Object> tsList = new ArrayList<Object>();
		List<Object> otList = new ArrayList<Object>();
		

		for(int i = 0; i < penList.size(); i++) {
		    tdateList.add(Integer.parseInt(penList.get(i).getTdateUnix()));

		    List<Object> c1 = new ArrayList<Object>();
		    c1.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c1.add(Integer.parseInt(penList.get(i).getC1()));
		    
		    List<Object> c2 = new ArrayList<Object>();
		    c2.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c2.add(Integer.parseInt(penList.get(i).getC2()));
		    
		    List<Object> c3 = new ArrayList<Object>();
		    c3.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c3.add(Integer.parseInt(penList.get(i).getC3()));
		    
		    List<Object> c4 = new ArrayList<Object>();
		    c4.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c4.add(Integer.parseInt(penList.get(i).getC4()));
		    
		    List<Object> c5 = new ArrayList<Object>();
		    c5.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c5.add(Integer.parseInt(penList.get(i).getC5()));
		    
		    List<Object> c6 = new ArrayList<Object>();
		    c6.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c6.add(Integer.parseInt(penList.get(i).getC6()));
		    
		    List<Object> c7 = new ArrayList<Object>();
		    c7.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c7.add(Integer.parseInt(penList.get(i).getC7()));
		    
		    List<Object> c72 = new ArrayList<Object>();
		    c72.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c72.add(Integer.parseInt(penList.get(i).getC72()));
		    
		    List<Object> c8 = new ArrayList<Object>();
		    c8.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c8.add(Integer.parseInt(penList.get(i).getC8()));
		    
		    List<Object> c9 = new ArrayList<Object>();
		    c9.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c9.add(Integer.parseInt(penList.get(i).getC9()));
		    
		    List<Object> c10 = new ArrayList<Object>();
		    c10.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c10.add(Integer.parseInt(penList.get(i).getC10()));
		    
		    List<Object> c11 = new ArrayList<Object>();
		    c11.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c11.add(Integer.parseInt(penList.get(i).getC11()));
		    
		    List<Object> c12 = new ArrayList<Object>();
		    c12.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c12.add(Integer.parseInt(penList.get(i).getC12()));
		    
		    List<Object> c13 = new ArrayList<Object>();
		    c13.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c13.add(Integer.parseInt(penList.get(i).getC13()));
		    
		    List<Object> c14 = new ArrayList<Object>();
		    c14.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c14.add(Integer.parseInt(penList.get(i).getC14()));
		    
		    List<Object> c15 = new ArrayList<Object>();
		    c15.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c15.add(Integer.parseInt(penList.get(i).getC15()));
		    
		    List<Object> c16 = new ArrayList<Object>();
		    c16.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c16.add(Integer.parseInt(penList.get(i).getC16()));
		    
		    List<Object> c17 = new ArrayList<Object>();
		    c17.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c17.add(Integer.parseInt(penList.get(i).getC17()));
		    
		    List<Object> c18 = new ArrayList<Object>();
		    c18.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c18.add(Integer.parseInt(penList.get(i).getC18()));
		    
		    List<Object> c19 = new ArrayList<Object>();
		    c19.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c19.add(Integer.parseInt(penList.get(i).getC19()));
		    
		    List<Object> c20 = new ArrayList<Object>();
		    c20.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c20.add(Integer.parseInt(penList.get(i).getC20()));
		    
		    List<Object> c21 = new ArrayList<Object>();
		    c21.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c21.add(Integer.parseInt(penList.get(i).getC21()));
		    
		    List<Object> c22 = new ArrayList<Object>();
		    c22.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    c22.add(Integer.parseInt(penList.get(i).getC22()));
		    
		    List<Object> cs1 = new ArrayList<Object>();
		    cs1.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    cs1.add(Integer.parseInt(penList.get(i).getCs1()) * 0.1);

		    
		    List<Object> cs2 = new ArrayList<Object>();
		    cs2.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    cs2.add(Integer.parseInt(penList.get(i).getCs2()));
		    
		    List<Object> cs3 = new ArrayList<Object>();
		    cs3.add(Integer.parseInt(penList.get(i).getTdateUnix()));	    
		    double cs3Ch = Integer.parseInt(penList.get(i).getCs3()) * 0.01 ;
		    cs3.add(cs3Ch);
		    
		    List<Object> cs4 = new ArrayList<Object>();
		    cs4.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    double cs4Ch = Integer.parseInt(penList.get(i).getCs4()) * 0.01;
		    cs4.add(cs4Ch);

		    List<Object> cs5 = new ArrayList<Object>();
		    cs5.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    cs5.add(Integer.parseInt(penList.get(i).getCs5()) * 0.1);

		    List<Object> cs6 = new ArrayList<Object>();
		    cs6.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    cs6.add(Integer.parseInt(penList.get(i).getCs6()) * 0.1);

		    List<Object> cs7 = new ArrayList<Object>();
		    cs7.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    cs7.add(Integer.parseInt(penList.get(i).getCs7()) * 0.1);

		    List<Object> cs8 = new ArrayList<Object>();
		    cs8.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    cs8.add(Integer.parseInt(penList.get(i).getCs8()) * 0.1);

		    List<Object> cs9 = new ArrayList<Object>();
		    cs9.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    cs9.add(Integer.parseInt(penList.get(i).getCs9()) * 0.1);

		    List<Object> cs10 = new ArrayList<Object>();
		    cs10.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    cs10.add(Integer.parseInt(penList.get(i).getCs10()) * 0.1);

		    List<Object> cs11 = new ArrayList<Object>();
		    cs11.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    cs11.add(Integer.parseInt(penList.get(i).getCs11()) * 0.1);

		    List<Object> cs12 = new ArrayList<Object>();
		    cs12.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    cs12.add(Integer.parseInt(penList.get(i).getCs12()) * 0.1);

		    List<Object> cs13 = new ArrayList<Object>();
		    cs13.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    cs13.add(Integer.parseInt(penList.get(i).getCs13()) * 0.1);

		    List<Object> cs14 = new ArrayList<Object>();
		    cs14.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    cs14.add(Integer.parseInt(penList.get(i).getCs14()) * 0.1);

		    List<Object> cs15 = new ArrayList<Object>();
		    cs15.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    cs15.add(Integer.parseInt(penList.get(i).getCs15()) * 0.1);

		    List<Object> cs16 = new ArrayList<Object>();
		    cs16.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    cs16.add(Integer.parseInt(penList.get(i).getCs16()) * 0.1);

		    
		    
		    List<Object> pr1 = new ArrayList<Object>();
		    pr1.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    pr1.add(Double.parseDouble(penList.get(i).getPr1()));
		    
		    
		    
		    List<Object> pr2 = new ArrayList<Object>();
		    pr2.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    pr2.add(Double.parseDouble(penList.get(i).getPr2()));
		    
		    List<Object> st = new ArrayList<Object>();
		    st.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    st.add(Integer.parseInt(penList.get(i).getSt()));
		    
		    List<Object> ts = new ArrayList<Object>();
		    ts.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    ts.add(Integer.parseInt(penList.get(i).getTs()) * 0.1);

		    
		    List<Object> ot = new ArrayList<Object>();
		    ot.add(Integer.parseInt(penList.get(i).getTdateUnix()));
		    ot.add(Integer.parseInt(penList.get(i).getOt()));
		    
		    
		    // 리스트에 추가
		    c1List.add(c1);
		    c2List.add(c2);
		    c3List.add(c3);
		    c4List.add(c4);
		    c5List.add(c5);
		    c6List.add(c6);
		    c7List.add(c7);
		    c72List.add(c72);
		    c8List.add(c8);
		    c9List.add(c9);
		    c10List.add(c10);
		    c11List.add(c11);
		    c12List.add(c12);
		    c13List.add(c13);
		    c14List.add(c14);
		    c15List.add(c15);
		    c16List.add(c16);
		    c17List.add(c17);
		    c18List.add(c18);
		    c19List.add(c19);
		    c20List.add(c20);
		    c21List.add(c21);
		    c22List.add(c22);
		    cs1List.add(cs1);
		    cs2List.add(cs2);
		    cs3List.add(cs3);
		    cs4List.add(cs4);
		    cs5List.add(cs5);
		    cs6List.add(cs6);
		    cs7List.add(cs7);
		    cs8List.add(cs8);
		    cs9List.add(cs9);
		    cs10List.add(cs10);
		    cs11List.add(cs11);
		    cs12List.add(cs12);
		    cs13List.add(cs13);
		    cs14List.add(cs14);
		    cs15List.add(cs15);
		    cs16List.add(cs16);
		    
		    pr1List.add(pr1);
		    pr2List.add(pr2);
		    
		    
		    stList.add(st);
		    
		    tsList.add(ts);
		    otList.add(ot);
		}

		Map<String, Object> c1Map = new HashMap<String, Object>();
		Map<String, Object> c2Map = new HashMap<String, Object>();
		Map<String, Object> c3Map = new HashMap<String, Object>();
		Map<String, Object> c4Map = new HashMap<String, Object>();
		Map<String, Object> c5Map = new HashMap<String, Object>();
		Map<String, Object> c6Map = new HashMap<String, Object>();
		Map<String, Object> c7Map = new HashMap<String, Object>();
		Map<String, Object> c72Map = new HashMap<String, Object>();
		Map<String, Object> c8Map = new HashMap<String, Object>();
		Map<String, Object> c9Map = new HashMap<String, Object>();
		Map<String, Object> c10Map = new HashMap<String, Object>();
		Map<String, Object> c11Map = new HashMap<String, Object>();
		Map<String, Object> c12Map = new HashMap<String, Object>();
		Map<String, Object> c13Map = new HashMap<String, Object>();
		Map<String, Object> c14Map = new HashMap<String, Object>();
		Map<String, Object> c15Map = new HashMap<String, Object>();
		Map<String, Object> c16Map = new HashMap<String, Object>();
		Map<String, Object> c17Map = new HashMap<String, Object>();
		Map<String, Object> c18Map = new HashMap<String, Object>();
		Map<String, Object> c19Map = new HashMap<String, Object>();
		Map<String, Object> c20Map = new HashMap<String, Object>();
		Map<String, Object> c21Map = new HashMap<String, Object>();
		Map<String, Object> c22Map = new HashMap<String, Object>();

		Map<String, Object> cs1Map = new HashMap<String, Object>();
		Map<String, Object> cs2Map = new HashMap<String, Object>();
		Map<String, Object> cs3Map = new HashMap<String, Object>();
		Map<String, Object> cs4Map = new HashMap<String, Object>();
		Map<String, Object> cs5Map = new HashMap<String, Object>();
		Map<String, Object> cs6Map = new HashMap<String, Object>();
		Map<String, Object> cs7Map = new HashMap<String, Object>();
		Map<String, Object> cs8Map = new HashMap<String, Object>();
		Map<String, Object> cs9Map = new HashMap<String, Object>();
		Map<String, Object> cs10Map = new HashMap<String, Object>();
		Map<String, Object> cs11Map = new HashMap<String, Object>();
		Map<String, Object> cs12Map = new HashMap<String, Object>();
		Map<String, Object> cs13Map = new HashMap<String, Object>();
		Map<String, Object> cs14Map = new HashMap<String, Object>();
		Map<String, Object> cs15Map = new HashMap<String, Object>();
		Map<String, Object> cs16Map = new HashMap<String, Object>();
		
		Map<String, Object> pr1Map = new HashMap<String, Object>();
		Map<String, Object> pr2Map = new HashMap<String, Object>();
		Map<String, Object> tsMap = new HashMap<String, Object>();
		Map<String, Object> otMap = new HashMap<String, Object>();
		Map<String, Object> stMap = new HashMap<String, Object>();
		
		c1Map.put("name", "Zone 1.1");
		c1Map.put("color", "#FF0000");
		c1Map.put("yAxis", 0);
		c1Map.put("data", c1List);

		c2Map.put("name", "Zone 1.2");
		c2Map.put("color", "yellow");
		c2Map.put("yAxis", 0);
		c2Map.put("data", c2List);

		c3Map.put("name", "Zone 2.1");
		c3Map.put("color", "#ABF200");
		c3Map.put("yAxis", 0);
		c3Map.put("data", c3List);

		c4Map.put("name", "Zone 2.2");
		c4Map.put("color", "#FFB2D9");
		c4Map.put("yAxis", 0);
		c4Map.put("data", c4List);

		c5Map.put("name", "Zone 3.1");
		c5Map.put("color", "#FFC19E");
		c5Map.put("yAxis", 0);
		c5Map.put("data", c5List);

		c6Map.put("name", "Zone 3.2");
		c6Map.put("color", "#F15F5F");
		c6Map.put("yAxis", 0);
		c6Map.put("data", c6List);

		c7Map.put("name", "Protect 1");
		c7Map.put("color", "#5F00FF");
		c7Map.put("yAxis", 0);
		c7Map.put("data", c7List);
		
		c72Map.put("name", "Protect 2");
		c72Map.put("color", "#5F00FF");
		c72Map.put("yAxis", 0);
		c72Map.put("data", c72List);

		c8Map.put("name", "Temp-load-1");
		c8Map.put("color", "#5CD1E5");
		c8Map.put("yAxis", 0);
		c8Map.put("data", c8List);

		c9Map.put("name", "Temp-load-2");
		c9Map.put("color", "#2F9D27");
		c9Map.put("yAxis", 0);
		c9Map.put("data", c9List);

		c10Map.put("name", "Temp-load-3");
		c10Map.put("color", "#3DB7CC");
		c10Map.put("yAxis", 0);
		c10Map.put("data", c10List);

		c11Map.put("name", "Temp-load-4");
		c11Map.put("color", "#4374D9");
		c11Map.put("yAxis", 0);
		c11Map.put("data", c11List);

		c12Map.put("name", "Temp-load-5");
		c12Map.put("color", "#9FC93C");
		c12Map.put("yAxis", 0);
		c12Map.put("data", c12List);

		c13Map.put("name", "Temp-load-6");
		c13Map.put("color", "#FF007F");
		c13Map.put("yAxis", 0);
		c13Map.put("data", c13List);

		c14Map.put("name", "Temp-load-7");
		c14Map.put("color", "#8C8C8C");
		c14Map.put("yAxis", 0);
		c14Map.put("data", c14List);

		c15Map.put("name", "Temp-load-8");
		c15Map.put("color", "#800000");
		c15Map.put("yAxis", 0);
		c15Map.put("data", c15List);

		c16Map.put("name", "Temp-load-9");
		c16Map.put("color", "#008080");
		c16Map.put("yAxis", 0);
		c16Map.put("data", c16List);

		c17Map.put("name", "Temp-load-10");
		c17Map.put("color", "#FFD700");
		c17Map.put("yAxis", 0);
		c17Map.put("data", c17List);

		c18Map.put("name", "Temp-load-11");
		c18Map.put("color", "#00CED1");
		c18Map.put("yAxis", 0);
		c18Map.put("data", c18List);

		c19Map.put("name", "Temp-load-12");
		c19Map.put("color", "#DC143C");
		c19Map.put("yAxis", 0);
		c19Map.put("data", c19List);

		c20Map.put("name", "Temp-load-13");
		c20Map.put("color", "#4B0082");
		c20Map.put("yAxis", 0);
		c20Map.put("data", c20List);

		c21Map.put("name", "Temp-load-14");
		c21Map.put("color", "#D2691E");
		c21Map.put("yAxis", 0);
		c21Map.put("data", c21List);

		c22Map.put("name", "Temp-load-15");
		c22Map.put("color", "#FF8C00");
		c22Map.put("yAxis", 0);
		c22Map.put("data", c22List);

		// cs1~cs16까지 색상 설정


		cs3Map.put("name", "Front Press");
		cs3Map.put("color", "#9400D3");
		cs3Map.put("yAxis", 2);
		cs3Map.put("data", cs3List);

		cs4Map.put("name", "Rear Press");
		cs4Map.put("color", "#A52A2A");
		cs4Map.put("yAxis", 2);
		cs4Map.put("data", cs4List);

		cs5Map.put("name", "force-sensor-1");
		cs5Map.put("color", "#228B22");
		cs5Map.put("yAxis", 1);
		cs5Map.put("data", cs5List);

		cs6Map.put("name", "force-sensor-2");
		cs6Map.put("color", "#B8860B");
		cs6Map.put("yAxis", 1);
		cs6Map.put("data", cs6List);

		cs7Map.put("name", "force-sensor-3");
		cs7Map.put("color", "#4169E1");
		cs7Map.put("yAxis", 1);
		cs7Map.put("data", cs7List);

		cs8Map.put("name", "force-sensor-4");
		cs8Map.put("color", "#C71585");
		cs8Map.put("yAxis", 1);
		cs8Map.put("data", cs8List);

		cs9Map.put("name", "force-sensor-5");
		cs9Map.put("color", "#DA70D6");
		cs9Map.put("yAxis", 1);
		cs9Map.put("data", cs9List);

		cs10Map.put("name", "force-sensor-6");
		cs10Map.put("color", "#4682B4");
		cs10Map.put("yAxis", 1);
		cs10Map.put("data", cs10List);

		cs11Map.put("name", "force-sensor-7");
		cs11Map.put("color", "#00FA9A");
		cs11Map.put("yAxis", 1);
		cs11Map.put("data", cs11List);

		cs12Map.put("name", "force-sensor-8");
		cs12Map.put("color", "#B22222");
		cs12Map.put("yAxis", 1);
		cs12Map.put("data", cs12List);

		cs13Map.put("name", "force-sensor-9");
		cs13Map.put("color", "#FF69B4");
		cs13Map.put("yAxis", 1);
		cs13Map.put("data", cs13List);

		cs14Map.put("name", "force-sensor-10");
		cs14Map.put("color", "#FFDAB9");
		cs14Map.put("yAxis", 1);
		cs14Map.put("data", cs14List);

		cs15Map.put("name", "force-sensor-11");
		cs15Map.put("color", "#7FFF00");
		cs15Map.put("yAxis", 1);
		cs15Map.put("data", cs15List);

		cs16Map.put("name", "force-sensor-12");
		cs16Map.put("color", "#BA55D3");
		cs16Map.put("yAxis", 1);
		cs16Map.put("data", cs16List);
		

		pr1Map.put("name", "furnace-vacuum");
		pr1Map.put("color", "green");
		pr1Map.put("yAxis", 2);
		pr1Map.put("data", pr1List);

		

		pr2Map.put("name", "diffusion-pump");
		pr2Map.put("color", "#BA55D3");
		pr2Map.put("yAxis", 2);
		pr2Map.put("data", pr2List);
		

		stMap.put("name", "set-temp");
		stMap.put("color", "pink");
		stMap.put("yAxis", 0);
		stMap.put("data", stList);
		

		
		
		
		cs1Map.put("name", "Current Load");
		cs1Map.put("color", "#0000FF");
		cs1Map.put("yAxis", 1);
		cs1Map.put("data", cs1List);

		cs2Map.put("name", "Set Load");
		cs2Map.put("color", "#008000");
		cs2Map.put("yAxis", 1);
		cs2Map.put("data", cs2List);
		
		
		tsMap.put("name", "force sensor sum");
		tsMap.put("color", "darkviolet");
		tsMap.put("yAxis", 1);
		tsMap.put("data", tsList);

		

		otMap.put("name", "oil pump temp");
		otMap.put("color", "mediumspringgreen");
		otMap.put("yAxis", 0);
		otMap.put("data", otList);
		
		
		
		
		rtnMap.put("tdate", tdateList);
		rtnMap.put("c1", c1Map);
		rtnMap.put("c2", c2Map);
		rtnMap.put("c3", c3Map);
		rtnMap.put("c4", c4Map);
		rtnMap.put("c5", c5Map);
		rtnMap.put("c6", c6Map);
		rtnMap.put("c7", c7Map);
		rtnMap.put("c72", c72Map);
		rtnMap.put("c8", c8Map);
		rtnMap.put("c9", c9Map);
		rtnMap.put("c10", c10Map);
		rtnMap.put("c11", c11Map);
		rtnMap.put("c12", c12Map);
		rtnMap.put("c13", c13Map);
		rtnMap.put("c14", c14Map);
		rtnMap.put("c15", c15Map);
		rtnMap.put("c16", c16Map);
		rtnMap.put("c17", c17Map);
		rtnMap.put("c18", c18Map);
		rtnMap.put("c19", c19Map);
		rtnMap.put("c20", c20Map);
		rtnMap.put("c21", c21Map);
		rtnMap.put("c22", c22Map);

		rtnMap.put("cs1", cs1Map);
		rtnMap.put("cs2", cs2Map);
		rtnMap.put("cs3", cs3Map);
		rtnMap.put("cs4", cs4Map);
		rtnMap.put("cs5", cs5Map);
		rtnMap.put("cs6", cs6Map);
		rtnMap.put("cs7", cs7Map);
		rtnMap.put("cs8", cs8Map);
		rtnMap.put("cs9", cs9Map);
		rtnMap.put("cs10", cs10Map);
		rtnMap.put("cs11", cs11Map);
		rtnMap.put("cs12", cs12Map);
		rtnMap.put("cs13", cs13Map);
		rtnMap.put("cs14", cs14Map);
		rtnMap.put("cs15", cs15Map);
		rtnMap.put("cs16", cs16Map);
		
		rtnMap.put("pr1", pr1Map);
		rtnMap.put("pr2", pr2Map);
		
		
		rtnMap.put("st", stMap);
		rtnMap.put("ts", tsMap);
		rtnMap.put("ot", otMap);

		if(!"asdasd".equals(pen_group_name)) {
			rtnMap.put("groupConcat", penGroupNameConcat);
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("data", rtnMap);
		
		return resultMap;
	}
	
	//펜 리스트 group_concat으로
	public String historyTrendPenGroupChartGroupName(String pen_group_name) {
		String result = "";
		
		Temper temper = new Temper();
		temper.setPen_group_name(pen_group_name);
		
		result = analysisService.historyTrendPenGroupChartGroupName(temper);
		
		return result;
	}
	
	
	//추후 펜 그룹명, 펜명으로 펜의 색 리턴
	public String penColor(String pen_group_name, String pen_name) {
		String result = "";
		
		
		return result;
	}
	
	
	//펜 그룹에 펜 추가
	@RequestMapping(value = "/analysis/penGroupPenAdd", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> penGroupPenAdd(
			@RequestParam(required=false) String penGroup,
			@RequestParam(required=false) String penColor,
			@RequestParam(required=false) String penName){
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		Temper temper = new Temper();
		temper.setPen_group_name(penGroup);
		temper.setPen_color(penColor);
		temper.setPen_name(penName);
		
		//해당그룹에 펜이 있는지 비교
		int selectTemperCount = analysisService.getPenGroupPenCount(temper);
		
		if(selectTemperCount == 0) {
			//펜이 없을때만 추가
			analysisService.penGroupPenAdd(temper);
			rtnMap.put("success",true);
		}else {
			//펜이 있으면 추가안됨
			rtnMap.put("success",false);
		}
		
		return rtnMap;
	}
	
	@RequestMapping(value = "/analysis/penGroupPenDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> penGroupPenDelete(
	        @RequestParam(required = false) String penGroup,
	        @RequestParam(required = false) String penName) {

	    Map<String, Object> rtnMap = new HashMap<String, Object>();


	    if (penGroup == null || penName == null) {
	        rtnMap.put("success", false);
	        rtnMap.put("message", "Pen 그룹과 이름을 모두 입력해야 합니다.");
	        return rtnMap;
	    }


	    Temper temper = new Temper();
	    temper.setPen_group_name(penGroup);
	    temper.setPen_name(penName);

	    try {

	        analysisService.penGroupPenDelete(temper);
	        
	     
	        rtnMap.put("success", true);
	        rtnMap.put("message", "Pen 데이터가 성공적으로 삭제되었습니다.");
	        
	    } catch (RuntimeException e) {
	        
	        e.printStackTrace();
	        rtnMap.put("success", false);
	        rtnMap.put("message", "서버 오류가 발생했습니다.");
	    }

	    return rtnMap;
	}

    //heaterPop
    @RequestMapping(value= "/furnace/operationPressPop/view", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> heaterPopView() throws UaException, InterruptedException, ExecutionException {
    	Map<String, Object> returnMap = new HashMap<String, Object>();
    	
    	OpcDataMap opcDataMap = new OpcDataMap();
    	
    	returnMap = opcDataMap.getOpcDataListMap("DONGHWA.FURNACE.OPERATION_PRESS");
    	
    	return returnMap;    	
    }
    
    //2025-04-03 추가
	@RequestMapping(value = "/analysis/batchReport/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> batchReportList(
			@RequestParam String sdate, @RequestParam String edate) {
	    Map<String, Object> rtnMap = new HashMap<String, Object>();
	    List<Object> rtnList = new ArrayList<Object>();
		
	    String startDateTime = sdate + " 00:00:00";
	    String endDateTime = edate + " 23:59:59";
	    
	    BatchReport batchReport = new BatchReport();
	    batchReport.setRecipe_stime(startDateTime);
	    batchReport.setRecipe_etime(endDateTime);

	    List<BatchReport> batchList = analysisService.batchReportList(batchReport);
	    
	    for(BatchReport batch : batchList) {
	    	Map<String, Object> rowMap = new HashMap<String, Object>();
	    	
	    	rowMap.put("idx", batch.getIdx());
	    	rowMap.put("recipe_number", batch.getRecipe_number());
	    	rowMap.put("recipe_name", batch.getRecipe_name());
	    	rowMap.put("recipe_comment", batch.getRecipe_comment());
	    	rowMap.put("recipe_stime", batch.getRecipe_stime());
	    	rowMap.put("recipe_etime", batch.getRecipe_etime());
	    	
	    	rtnList.add(rowMap);	    	
	    }
	    
	    rtnMap.put("data", rtnList);
	    rtnMap.put("last_page",1);
	    
	    
	    return rtnMap;
	}
    //
	//배치리포트 트렌드
	@RequestMapping(value = "/analysis/batchReport/trend", method = RequestMethod.GET)
	public String graphicalProcess(Model model) {
		
		String result = "/analysis/batchReportTrend.jsp";
		
		return result;
	}
	
	///analysis/batchReport/trendData
}
