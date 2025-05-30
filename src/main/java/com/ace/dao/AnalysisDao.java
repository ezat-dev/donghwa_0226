package com.ace.dao;

import java.util.List;

import com.ace.domain.Alarm;
import com.ace.domain.BatchReport;
import com.ace.domain.Temper;

public interface AnalysisDao {

	List<Temper> historyTrendPenGroupList(Temper temper);

	List<String> historyTrendPenGroupSelect();

	List<Temper> historyTrendPenGroupChart(Temper temper);

	String historyTrendPenGroupChartGroupName(Temper temper);

	
	List<Alarm> alarmlist(Alarm alarm); 
	
	List<Alarm> alarmlistOverview();
	
	List<Alarm> alarmData();
	

	void penGroupPenAdd(Temper temper);
	
	void penGroupPenDelete(Temper temper);

	int getPenGroupPenCount(Temper temper);

	List<BatchReport> batchReportList(BatchReport batchReport);	
}
