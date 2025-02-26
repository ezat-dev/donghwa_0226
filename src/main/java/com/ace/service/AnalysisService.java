package com.ace.service;

import java.util.List;

import com.ace.domain.Alarm;
import com.ace.domain.Temper;

public interface AnalysisService {

	
	List<Temper> historyTrendPenGroupList(Temper temper);

	List<String> historyTrendPenGroupSelect();

	List<Temper> historyTrendPenGroupChart(Temper temper);

	String historyTrendPenGroupChartGroupName(Temper temper);
	
	List<Alarm> alarmlist(Alarm alarm);
	
	List<Alarm> alarmlistOverview();

	void penGroupPenAdd(Temper temper);

	int getPenGroupPenCount(Temper temper);	
}
